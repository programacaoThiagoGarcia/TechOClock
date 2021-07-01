package tests.Users

import BaseClass
import org.testng.annotations.Test

class UsersTest : BaseClass() {
    @Test(groups = ["UsersTest"])
    fun elementClick(){
        usersPage.addButtonClick()

    }

    @Test(groups = ["UsersTest"])
    fun elementsExists() {
        usersPage.titlePageExists()
        usersPage.addButtonExists()
        usersPage.warningsExists()

    }


}