package tests.Register

import BaseClass
import org.testng.annotations.Test

class RegisterTest : BaseClass() {

    @Test(groups = ["RegisterTest"])
    fun elementsExists(){
        registerPage.openRegisterPage()
        registerPage.tfNameExists()
        registerPage.tfEmailExist()
        registerPage.tfNIFExists()
        registerPage.btnExist()
        registerPage.titlePageExists("REGISTO")
    }

    @Test(groups = ["RegisterTest"])
    fun nameValidation(){
        registerPage.openRegisterPage()
        registerPage.btnButtonClick()
        registerPage.tfNameErrorExist()

    }

    @Test(groups = ["RegisterTest"])
    fun nifValidation(){
        registerPage.openRegisterPage()
        registerPage.btnButtonClick()
        registerPage.tfNIFErrorExists()

    }

    @Test(groups = ["RegisterTest"])
    fun emailValidation(){
        registerPage.openRegisterPage()
        registerPage.btnButtonClick()
        registerPage.tfEmailErrorExists()

    }

    @Test(groups = ["RegisterTest"])
    fun registerUser(){
        registerPage.openRegisterPage()
        registerPage.setName()
        registerPage.setNIF()
        registerPage.setEmail()
        registerPage.btnButtonClick()
        registerPage.titlePageExists("CONCLUSÃO")
    }

    @Test(groups = ["RegisterTest"])
    fun completeRegisterUser(){
        registerUser()
        registerPage.btnOKClick()
        registerPage.userExists()
    }

}