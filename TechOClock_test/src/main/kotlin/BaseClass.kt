import appium.AppiumManager
import helper.OS
import io.appium.java_client.AppiumDriver
import org.openqa.selenium.WebElement
import org.testng.ITestResult
import org.testng.annotations.AfterMethod
import org.testng.annotations.AfterTest
import org.testng.annotations.BeforeTest
import pages.IOS.RegisterPageIOS
import pages.IOS.UsersPageIOS
import pages.RegisterPage
import pages.UsersPage

open class BaseClass {
    lateinit var registerPage: RegisterPage
    lateinit var usersPage: UsersPage

    @BeforeTest
    fun setUp() {
        AppiumManager.instance.start()
        val driver = AppiumManager.instance.driver

        when(AppiumManager.instance.getSO()){
            OS.IOS ->{
                iOSInitTestsFlow(driver)
            }
            OS.ANDROID ->{
                androidInitTestsFlow(driver)
            }
        }

    }

    private fun androidInitTestsFlow(driver: AppiumDriver<WebElement>) {
        //TODO: Colocar "PAGES" dos testes de Android
    }

    private fun iOSInitTestsFlow(driver: AppiumDriver<WebElement>) {
        registerPage = RegisterPageIOS(driver)
        usersPage = UsersPageIOS(driver)
    }

    @AfterTest
    fun tearDown() {
        AppiumManager.instance.driver.closeApp()
    }

    @AfterMethod(alwaysRun = true)
    fun resetApp(result: ITestResult) {
        AppiumManager.instance.driver.resetApp()
        val methodName: String = result.method.constructorOrMethod.method.name
        print("$methodName \n")
    }


}