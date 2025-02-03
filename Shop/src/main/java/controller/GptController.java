
package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.ProcessBuilder.Redirect;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;

@Controller
public class GptController { // 입력하세요.

	private static final String API_KEY = "AIzaSyD1S0M7AWEupvTgnlULybhp7FyXtAadaXg"; // 여기에 API 키를 입력하세요
	private static final String MODEL_NAME = "gemini-pro"; // 사용할 모델을 선택하세요

	@RequestMapping(value = "/gpt", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String gpt(Model model, String msg) {
		String prompt = msg;
		String response = "";
		try {
			response = callGeminiApi(prompt);
			System.out.println("Response from API: " + response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return response;
	}

	private static String callGeminiApi(String prompt) throws Exception {
		String urlString = "https://generativelanguage.googleapis.com/v1beta/models/" + MODEL_NAME
				+ ":generateContent?key=" + API_KEY;
		URL url = new URL(urlString);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setDoOutput(true);

		// JSON 형식이 올바른지 확인
		String jsonInputString = String.format("{\"contents\": [{\"parts\": [{\"text\": \"%s\"}]}]}",
				prompt.replace("\n", "\\n"));

		try (OutputStream os = conn.getOutputStream()) {
			byte[] input = jsonInputString.getBytes("utf-8");
			os.write(input, 0, input.length);
		}

		int responseCode = conn.getResponseCode();
		if (responseCode == 200) { // 성공적인 응답 코드 200을 체크
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}

				// JSON 응답에서 메시지만 추출
				JSONObject jsonResponse = new JSONObject(response.toString());
				if (jsonResponse.has("candidates")) {
					JSONArray candidates = jsonResponse.getJSONArray("candidates");
					StringBuilder message = new StringBuilder();
					for (int i = 0; i < candidates.length(); i++) {
						JSONObject content = candidates.getJSONObject(i).getJSONObject("content");
						JSONArray parts = content.getJSONArray("parts");
						for (int j = 0; j < parts.length(); j++) {
							message.append(parts.getJSONObject(j).getString("text")).append("\n");
						}
					}
					System.out.println(message.toString().trim());
					return message.toString().trim();
				} else {
					return "No candidates found in the response.";
				}
			}
		} else if (responseCode == 401) {
			throw new RuntimeException(
					"Failed : HTTP error code : 401 Unauthorized. Please check your API key and permissions.");
		} else if (responseCode == 400) {
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}
				throw new RuntimeException(
						"Failed : HTTP error code : 400 Bad Request. Response: " + response.toString());
			}
		} else {
			throw new RuntimeException("Failed : HTTP error code : " + responseCode);
		}
	}
	
	@RequestMapping("gptView")
	public String gptView() {
		return Common.Path.CUSTOMER_PATH + "gpt.jsp";
	}
}
