package pages.IOS

import io.appium.java_client.AppiumDriver
import io.appium.java_client.MobileElement
import io.appium.java_client.pagefactory.AppiumFieldDecorator
import org.openqa.selenium.By
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.PageFactory
import org.openqa.selenium.support.ui.ExpectedConditions
import org.openqa.selenium.support.ui.WebDriverWait
import org.testng.Assert
import pages.RegisterPage
import java.util.concurrent.TimeUnit

class RegisterPageIOS(private val driver: AppiumDriver<WebElement>) : RegisterPage {
    init {
        PageFactory.initElements(AppiumFieldDecorator(driver), this)
    }

    override fun tfNameExists() {
        driver.findElementByAccessibilityId("name")
    }

    override fun tfNIFExists() {
        driver.findElementByAccessibilityId("nif")
    }

    override fun tfEmailExist() {
        driver.findElementByAccessibilityId("email")
    }

    override fun btnExist() {
        driver.findElementByAccessibilityId("conclusion")
    }

    override fun btnButtonClick() {
        val btn = driver.findElementByAccessibilityId("conclusion")
        btn.click()
    }

    override fun tfNameErrorExist() {
        driver.findElementByAccessibilityId("erroName")
    }

    override fun tfNIFErrorExists() {
        driver.findElementByAccessibilityId("erroNif")
    }

    override fun tfEmailErrorExists() {
        driver.findElementByAccessibilityId("erroEmail")
    }

    override fun setName() {
        val tfName = driver.findElementByAccessibilityId("name")
        tfName.sendKeys("Thiago"+"\n")

    }

    override fun setNIF() {
        val tfNIF = driver.findElementByAccessibilityId("nif")
        tfNIF.sendKeys("123456789"+"\n")
    }

    override fun setEmail() {
        val tfEmail = driver.findElementByAccessibilityId("email")
        tfEmail.sendKeys("teste@teste.com"+"\n")
    }

    override fun btnOKClick() {
        val btn = driver.findElementByAccessibilityId("finish")
        btn.click()
    }

    override fun userExists() {
        val name = driver.findElementByAccessibilityId("emailCell")
        Assert.assertEquals(name.text,"thiago@itsector.pt")
        driver.findElementByAccessibilityId("nameCell")
        driver.findElementByAccessibilityId("nifCell")
    }

    override fun openRegisterPage() {
        driver.manage().timeouts().implicitlyWait(10,TimeUnit.SECONDS)
        driver.findElementByAccessibilityId("add").click()

    }

    override fun titlePageExists(title: String) {
        val title : MobileElement = WebDriverWait(driver,5).until(ExpectedConditions.presenceOfElementLocated(By.id(title))) as MobileElement
        Assert.assertTrue(title.isDisplayed)
    }


}