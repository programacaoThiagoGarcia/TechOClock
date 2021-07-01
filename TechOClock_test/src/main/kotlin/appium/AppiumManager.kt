package appium

import helper.OS
import io.appium.java_client.AppiumDriver
import io.appium.java_client.android.AndroidDriver
import io.appium.java_client.ios.IOSDriver
import io.appium.java_client.remote.MobileCapabilityType
import org.openqa.selenium.WebElement
import org.openqa.selenium.remote.DesiredCapabilities
import java.io.File
import java.net.MalformedURLException
import java.net.URL

class AppiumManager {
    private val mAppiumServerUrl = "http://localhost:4723/wd/hub"
    private var executionOS: OS? = null
    lateinit var driver: AppiumDriver<WebElement>

    companion object {
        val instance = AppiumManager()
    }

    fun start() {
        Config.configJson()
        Config.TEST_DEVICE?.let {
            executionOS = it
        }
        try {
            initCapabilities()
        } catch (e: MalformedURLException) {
        }

    }

    fun getSO() = executionOS

    private fun initCapabilities() {
        val desiredCapabilities = DesiredCapabilities()
        val remoteURL = URL(mAppiumServerUrl)
        desiredCapabilities.setCapability(MobileCapabilityType.NEW_COMMAND_TIMEOUT, 60)
        val capabilities = executionOS?.let { Config.getCapabilities(it.os) }

        when (executionOS) {
            OS.IOS -> {
                if (capabilities != null) {
                    desiredCapabilities.run {
                        setCapability(
                            MobileCapabilityType.PLATFORM_NAME,
                            capabilities[MobileCapabilityType.PLATFORM_NAME]
                        )
                        setCapability(
                            MobileCapabilityType.PLATFORM_VERSION,
                            capabilities[MobileCapabilityType.PLATFORM_VERSION]
                        )
                        setCapability(
                            MobileCapabilityType.DEVICE_NAME,
                            capabilities[MobileCapabilityType.DEVICE_NAME]
                        )
                        setCapability(
                            MobileCapabilityType.AUTOMATION_NAME,
                            capabilities[MobileCapabilityType.AUTOMATION_NAME]
                        )
                        setCapability(
                            MobileCapabilityType.APP,
                            capabilities[MobileCapabilityType.APP]
                        )
                        //setCapability(MobileCapabilityType.APP, capabilities[MobileCapabilityType.APP])
                    }
                }

                driver = IOSDriver(remoteURL, desiredCapabilities)
            }
            OS.ANDROID -> {
                val src = File("src/main/resources/Android")
                val app = File(src, "app.apk")
                desiredCapabilities.run {
                    setCapability(MobileCapabilityType.DEVICE_NAME, "Pixel_4a_API_30")
                    setCapability(MobileCapabilityType.AUTOMATION_NAME, "uiautomator2")
                    setCapability(MobileCapabilityType.APP, app.absolutePath)
                }
                driver = AndroidDriver(remoteURL, desiredCapabilities)
            }
        }

    }


}