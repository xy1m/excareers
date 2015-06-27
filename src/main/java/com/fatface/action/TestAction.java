/*package com.fatface.action;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.scribe.builder.ServiceBuilder;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.model.Verifier;
import org.scribe.oauth.OAuthService;
import org.springframework.web.servlet.ModelAndView;

import com.fatface.util.CookieUtils;
import com.fatface.util.LinkedIn2Api;

public class TestAction {

    public static final String PROTECTED_RESOURCE_URL = "https://api.linkedin.com/v1/people/~";
    public static final String API_KEY                = "75behd12ztnmus";
    public static final String SECRET                 = "EBono1sp6nfbshXw";
    public static final Token  EMPTY_TOKEN            = null;
    public static final String CALLBACK_URL           = "http://127.0.0.1/linkedin/redirect";

    private OAuthService       service                = new ServiceBuilder()
                                                          .provider(LinkedIn2Api.class)
                                                          .apiKey(API_KEY).apiSecret(SECRET)
                                                          .callback(CALLBACK_URL).build();

    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("/user/login");
        String state = UUID.randomUUID().toString();
        String authorizationURL = service.getAuthorizationUrl(EMPTY_TOKEN);
        String linkedInURL = authorizationURL + "&state=" + state;
        mav.addObject("linkedInURL", linkedInURL);
        return mav;
    }

    public ModelAndView redirect(String code, String state, HttpServletResponse res) {
        ModelAndView mav = new ModelAndView("/user/profile");
        Verifier verifier = new Verifier(code);
        Token accessToken = service.getAccessToken(EMPTY_TOKEN, verifier);

        CookieUtils.addCookie(res, "access_token", accessToken.getToken());

        OAuthRequest request = new OAuthRequest(Verb.GET, PROTECTED_RESOURCE_URL);
        request.addHeader("x-li-format", "json");
        request.addQuerystringParameter("oauth2_access_token", accessToken.getToken());
        Response response = request.send();
        mav.addObject("basic", response.getBody());
        return mav;
    }

    public String testUpdate(HttpServletRequest req) {
        OAuthRequest request = new OAuthRequest(Verb.GET,
            "https://api.linkedin.com/v1/people/~/network/updates");
        request.addHeader("x-li-format", "json");
        String access_token = CookieUtils.getCookie(req, "access_token");
        request.addQuerystringParameter("oauth2_access_token", access_token);
        Response response = request.send();
        return response.getBody();
    }

    public String testCompany(HttpServletRequest req) {
        OAuthRequest request = new OAuthRequest(Verb.GET,
            "https://api.linkedin.com/v1/companies/1337");
        request.addHeader("x-li-format", "json");
        String access_token = CookieUtils.getCookie(req, "access_token");
        request.addQuerystringParameter("oauth2_access_token", access_token);
        System.out.println(access_token);
        Response response = request.send();
        return response.getBody();
    }

    public String testShare(HttpServletRequest req) {
        OAuthRequest request = new OAuthRequest(Verb.POST,
            "https://api.linkedin.com/v1/people/~/shares");
        request.addHeader("x-li-format", "json");
        request.addHeader("Content-Type", "application/json");

        String access_token = CookieUtils.getCookie(req, "access_token");
        request.addQuerystringParameter("oauth2_access_token", access_token);

        JSONObject share = new JSONObject();
        share.put("comment", "Posting from the API using JSON");

        JSONObject contentObject = new JSONObject();
        contentObject.put("title", "from LinkedIn API share program");
        contentObject.put("description", "auto send by program");
        contentObject.put("submitted-url", "https://github.com/CrazyMole");
        contentObject.put("submitted-image-url",
            "https://avatars0.githubusercontent.com/u/3718563?v=2&s=460");

        share.put("content", contentObject);

        JSONObject visibilityObject = new JSONObject();
        visibilityObject.put("code", "anyone");

        share.put("visibility", visibilityObject);
        request.addPayload(share.toString());
        Response response = request.send();
        return response.getBody();
    }
}
*/