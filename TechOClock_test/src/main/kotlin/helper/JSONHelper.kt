package helper

import org.json.simple.JSONObject
import org.json.simple.parser.JSONParser
import java.io.FileReader

object JSONHelper {
    fun readJson(path : String) : JSONObject {
        val obj = JSONParser().parse(FileReader(path))
        return obj as JSONObject
    }

    fun getCapabilities(os : String, jsonObject: JSONObject) : JSONObject{
        val capabilities = jsonObject["capabilities"] as JSONObject
        return  capabilities[os] as JSONObject
    }

    fun getLaunchOS(jsonObject: JSONObject) = jsonObject["launchOS"].toString()
}