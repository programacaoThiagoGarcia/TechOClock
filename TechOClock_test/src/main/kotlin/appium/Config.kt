package appium

import helper.JSONHelper
import helper.OS
import org.json.simple.JSONObject

object Config {
    private const val jsonPath = "./src/main/kotlin/helper/config.json"
    private lateinit var jsonObject: JSONObject
    var TEST_DEVICE: OS? = null

    fun configJson() {
        try {
            jsonObject = JSONHelper.readJson(jsonPath)
            TEST_DEVICE = setOS(JSONHelper.getLaunchOS(jsonObject))
        } catch (e: Exception) {
            print(e.message)
        }
    }

    private fun setOS(os : String) = if(os == "android") OS.ANDROID else OS.IOS
    fun getCapabilities(os: String) = JSONHelper.getCapabilities(os, jsonObject)
}