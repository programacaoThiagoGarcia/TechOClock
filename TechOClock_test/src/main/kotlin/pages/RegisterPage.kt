package pages

interface RegisterPage {
    fun openRegisterPage()

    fun titlePageExists(title : String)

    fun tfNameExists()
    fun tfNIFExists()
    fun tfEmailExist()
    fun btnExist()

    fun btnButtonClick()

    fun tfNameErrorExist()
    fun tfNIFErrorExists()
    fun tfEmailErrorExists()

    fun setName()
    fun setNIF()
    fun setEmail()

    fun btnOKClick()
    fun userExists()

}