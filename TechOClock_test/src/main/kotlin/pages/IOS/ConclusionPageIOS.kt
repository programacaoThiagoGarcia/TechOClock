package pages.IOS

import io.appium.java_client.AppiumDriver
import io.appium.java_client.pagefactory.AppiumFieldDecorator
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.PageFactory
import pages.ConclusionPage

class ConclusionPageIOS(private val driver: AppiumDriver<WebElement>) : ConclusionPage {
    init {
        PageFactory.initElements(AppiumFieldDecorator(driver), this)
    }

    override fun openConclusionPage() {

    }

    override fun titlePageExists(title: String) {

    }

    override fun itensExists() {

    }
}