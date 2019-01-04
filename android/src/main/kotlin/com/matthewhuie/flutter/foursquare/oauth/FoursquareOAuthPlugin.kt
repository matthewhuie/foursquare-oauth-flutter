package com.matthewhuie.flutter.foursquare.oauth

import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.PluginRegistry
import com.foursquare.android.nativeoauth.FoursquareOAuth

class FoursquareOAuthPlugin: MethodCallHandler, PluginRegistry.ActivityResultListener {
  companion object {
    private lateinit var registrar: Registrar
    private lateinit var clientId: String
    private lateinit var clientSecret: String
    private lateinit var methodCallResult: Result

    private const val METHOD_CHANNEL_NAME = "com.matthewhuie.flutter.foursquare.oauth"
    private const val METHOD_AUTHENTICATE = "authenticate"
    private const val REQUEST_CODE_FSQ_CONNECT = 200
    private const val REQUEST_CODE_FSQ_TOKEN_EXCHANGE = 201

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), METHOD_CHANNEL_NAME)
      channel.setMethodCallHandler(FoursquareOAuthPlugin())
      registrar.addActivityResultListener(FoursquareOAuthPlugin())
      this.registrar = registrar
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == METHOD_AUTHENTICATE) {
      clientId = call.argument("clientId") ?: "FOURSQUARE_INVALID_CLIENT_ID"
      clientSecret = call.argument("clientSecret") ?: "FOURSQUARE_INVALID_CLIENT_SECRET"
      methodCallResult = result
      val intent = FoursquareOAuth.getConnectIntent(registrar.context(), clientId)
      registrar.activity().startActivityForResult(intent, REQUEST_CODE_FSQ_CONNECT)
    } else {
      result.notImplemented()
    }
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    when (requestCode) {
      REQUEST_CODE_FSQ_CONNECT -> {
        val codeResponse = FoursquareOAuth.getAuthCodeFromResult(resultCode, data)
        if (codeResponse.exception == null) {
          val intent = FoursquareOAuth.getTokenExchangeIntent(registrar.context(), clientId, clientSecret, codeResponse.code)
          registrar.activity().startActivityForResult(intent, REQUEST_CODE_FSQ_TOKEN_EXCHANGE)
        }
      }
      REQUEST_CODE_FSQ_TOKEN_EXCHANGE -> {
        val tokenResponse = FoursquareOAuth.getTokenFromResult(resultCode, data)
        if (tokenResponse.exception == null) {
          methodCallResult.success(tokenResponse.accessToken)
        }
      }
      else ->
        methodCallResult.error("FOURSQUARE_OAUTH_ERROR", "Error while authenticating with Foursquare.", null)
    }
    return false
  }
}
