import 'package:l10n_flutter/l10n_core.dart';

// Supported locales
const dkSettings = L10nSettings(path: 'assets/l10n', locales: [
  L10nLocale('en', 'US', 'English, (US)'),
  //L10nLocale('en', 'GB', 'English (United Kingdom)'),
]);

@dkSettings
class DkLanguage {
  static const allRequired = L10nSet('allRequired', 'All are required.'),
      accountCreated_1 = L10nSet(
          'accountCreated_1', 'Thank you for creating a DaveKnows account.'),
      accountCreated_2 = L10nSet('accountCreated_2',
          'To complete the process, please look for an email from'),
      accountCreated_3 = L10nSet('accountCreated_3', ' in your inbox, spam, or junk folders.'),
      accountCreated_4 = L10nSet('accountCreated_4',
          'Enter the verification number below:.'),
      accountCreated_6 = L10nSet('accountCreated_6', 'Welcome to DaveKnow!'),
      accountExists = L10nSet('accountExists', 'I have an account'),
      address = L10nSet('address', 'Address'),
      addressMessage = L10nSet('addressMessage',
          'Your address must be added and verified before you can use the service.'),
      areaCode = L10nSet('areaCode', 'Area Code'),
      areaCodeHint = L10nSet('areaCodeHint', 'area code'),
      areaCodeRequired = L10nSet('areaCodeRequired', 'Area code is required.'),
      areaCodeToShort =
          L10nSet('areaCodeToShort', 'Area code must be 3 digits.'),
      back = L10nSet('back', 'Back'),
      birthdate = L10nSet('birthdate', 'Enter your birthdate'),
      birthdateHint = L10nSet('birthdateHint', 'MM/DD/YYYY'),
      birthdateRequired =
          L10nSet('birthdateRequired', 'Your birthdate is required.'),
      changePassword = L10nSet('changePassword', 'Change Password'),
      checkEmail =
          L10nSet('checkEmail', 'DaveKnows email will arrive usually within 5 minutes but could take up to 1 day. \n \nPlease check your inbox, spam, or junk folders for an email from support@sty-holdings.com.'),
      city = L10nSet('city', 'City'),
      cityHint = L10nSet('cityHint', 'Your city'),
      code = L10nSet('code', 'Code'),
      codeHint = L10nSet('codeHint', 'Enter verification code'),
      company = L10nSet('company', 'Company Legal Name'),
      companyHint = L10nSet('companyHist', 'Company Legal Name'),
      companyRequired = L10nSet('companyRequired', 'You must enter your company name.'),
      country = L10nSet('country', 'Country'),
      countryHint = L10nSet('countryHint', 'Country'),
      countryRequired = L10nSet('countryRequired', 'You must enter your country.'),
      confirmPassword = L10nSet('confirmPassword', 'Confirm Password'),
      confirmPasswordHint = L10nSet('confirmPasswordHint', 'Re-enter Password'),
      createAccount = L10nSet('createAccount', 'Create an Account'),
      createAccountTitle_1 = L10nSet('createAccountTitle_1', 'Lets get to know each other 🙂'),
      createAccountTitle_2 = L10nSet('createAccountTitle_2', '📧 How to contact you? 📞'),
      createAccountTitle_3 = L10nSet('createAccountTitle_3', '🔐 Protecting your account! 🔐'),
      currentPassword = L10nSet('currentPassword', 'Current Password'),
      currentPasswordHint = L10nSet('currentPasswordHint', 'Enter your password'),
      displayUsername = L10nSet('displayUsername', 'Here is your username:'),
      email = L10nSet('email', 'Email'),
      emailHint = L10nSet('emailHint', 'Enter Email'),
      emailRequired = L10nSet('emailRequired', 'Email is required.'),
      emailValidator = L10nSet('emailValidator', 'Invalid email'),
      escalationMethod = L10nSet('escalationMethod', 'Please select the order of communication when there is an escalation.'),
      firstName = L10nSet('firstName', 'First Name'),
      firstNameHint = L10nSet('firstNameHint', 'first name'),
      firstNameRequired = L10nSet('firstNameRequired', 'You must enter your first name.'),
      forgotPassword = L10nSet('forgotPassword', 'Forgot Password'),
      forgotUsername = L10nSet('forgotUsername', 'Forgot Username'),
      home = L10nSet('home', 'Home'),
      internalError = L10nSet('internalError', 'Internal Error in mobile app. Please contact DaveKnows at helpdesk@daveknows.ai.', common: true),
      lastName = L10nSet('lastName', 'Last Name'),
      lastNameHint = L10nSet('lastNameHint', 'last name'),
      lastNameRequired = L10nSet('lastNameRequired', 'You must enter your last name.'),
      login = L10nSet('login', 'Login'),
      logout = L10nSet('logout', 'Log Out'),
      marketingSlogan = L10nSet('marketingSlogan', 'Marketing Slogan here'),
      needHelp = L10nSet('needHelp', 'Need Help?'),
      nextPage = L10nSet('nextPage', 'Next'),
      newPassword = L10nSet('newPassword', 'New Password'),
      noAccount = L10nSet('noAccount', 'Don\'t have account?'),
      oneRequired = L10nSet('oneRequired', 'One is required.'),
      optional = L10nSet('optional', 'Optional'),
      pageNotFound = L10nSet('pageNotFound', 'Page not found.', common: true),
      password = L10nSet('password', 'Password'),
      passwordChanged = L10nSet('passwordChanged', 'Account password has been changed successfully!'),
      passwordHint = L10nSet('passwordHint', 'Enter Password'),
      passwordNoChanged = L10nSet('passwordNoChanged', 'Your password cannot be reset at this time.'),
      passwordRecommendation = L10nSet('passwordRecommendation', 'Password must be at least 8 characters long\n- contains at least 1 number\n- contains at least 1 uppercase and 1 lower case letter\n- contains at least 1 special character'),
      passwordSent = L10nSet('passwordSent', 'Please check your email for the code to reset your password. The email will be from support@sty-holdings.com and it will be in your inbox, spam, or junk folders. \n \nPlease enter the verification code and new password below.'),
      passwordsNoMatch = L10nSet('passwordsNoMatch', 'Passwords don\'t match!'),
      passwordValidator = L10nSet('passwordValidator', 'Minimum 8 characters long'),
      phoneLine = L10nSet('phoneLine', 'Phone'),
      phoneLineHint = L10nSet('phoneLineHint', 'number'),
      phoneLineRequired = L10nSet('phoneLineRequired', '7 digit phone number required'),
      phoneLineToShort = L10nSet('phoneLineToShort', 'phone number must be 7 digits'),
      phoneNumber = L10nSet('phoneNumber', 'Phone'), // This is for the full 10 digit phone number
      phoneNumberHint = L10nSet('phoneNumberHint', 'number'), // This is for the full 10 digit phone number
      phoneNumberRequired = L10nSet('phoneNumberRequired', 'Both area code and phone number are needed.'), // This is for the full 10 digit phone number
      resendConfirmation = L10nSet('resendConfirmation', 'Resend Confirmation'),
      returnToLogin = L10nSet('returnToLogin', 'Return to Login'),
      signupAccount = L10nSet('signupAccount', 'Sign Up for DaveKnows'),
      state = L10nSet('state', 'State'),
      stateCA = L10nSet('stateCA', 'CA'),
      streetAddress = L10nSet('streetAddress', 'Street address'),
      streetAddressHint = L10nSet('streetAddressHint', 'Your street address'),
      submit = L10nSet('submit', 'Submit'),
      titleApp = 'DaveKnows App',
      titleContactDetails = L10nSet('contactDetails', 'Contact Details'),
      titleHello = L10nSet('homeTitle', 'Hello,'),
      titleHome = L10nSet('homeTitle', 'Home,'),
      titleLogin = L10nSet('loginTitle', 'Login'),
      titleUserProfile = L10nSet('userProfileTitle', '\'s Profile'),
      titleUserSecurity = L10nSet('titleUserSecurity', '\'s Security Settings'),
      titleUserSettings = L10nSet('titleUserSettings', '\'s Settings & Info'),
      transfer = L10nSet('transfer', 'Transfer Funds'),
      updateProfile = L10nSet('updateProfile', 'Update Profile'),
      userName = L10nSet('userName', 'User Name'),
      userNameRequired = L10nSet('userNameRequired', 'Username is required.'),
      userNameToShort = L10nSet('userNameToShort', 'Username must be at least 8 characters.'),
      userNameHint = L10nSet('userNameHint', 'Enter your user name'),
      userNameEmailRecommendations = L10nSet('userNameEmailRecommendations', 'It\'s recommend you use your email address.'),
      usernameValidator = L10nSet('usernameValidator', 'User name must contain at least 8 characters.'),
      verifyPassword = L10nSet('verifyPassword', 'Verify Password'),
      verifyConfirmationCode  = L10nSet('verifyConfirmationCode', 'Verify Code'),
      alanTuringQuote1 = L10nSet('alanTuringQuote1', 'This is only a foretaste of what is to come, and only the shadow of what is going to be.'),
      alanTuringAuthor = L10nSet('alanTuringAuthor', '- Alan Turing (Father of AI)'),
      yourState = L10nSet('yourState', 'The state where you reside:'),
      zipCode = L10nSet('zipCode', 'Zip Code'),
      zipCodeHint = L10nSet('zipCodeHint', 'Zip code');
}
