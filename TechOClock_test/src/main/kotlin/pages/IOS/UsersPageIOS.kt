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
import pages.UsersPage



class UsersPageIOS(private val driver: AppiumDriver<WebElement>) : UsersPage {
    init {
        PageFactory.initElements(AppiumFieldDecorator(driver), this)
    }

    override fun addButtonExists() {
        driver.findElementByAccessibilityId("add")
    }

    override fun titlePageExists() {
        val title : MobileElement = WebDriverWait(driver,5).until(ExpectedConditions.presenceOfElementLocated(By.id("UTILIZADORES"))) as MobileElement
        Assert.assertTrue(title.isDisplayed)
    }

    override fun addButtonClick() {
        val add = driver.findElementByAccessibilityId("add")
        add.click()
        val title : MobileElement = WebDriverWait(driver,5).until(ExpectedConditions.presenceOfElementLocated(By.id("REGISTO"))) as MobileElement
        Assert.assertTrue(title.isDisplayed)
    }

    override fun warningsExists() {
        driver.findElementByAccessibilityId("warning")
        driver.findElementByAccessibilityId("warning_text")
    }
}