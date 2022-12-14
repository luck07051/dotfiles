// firefox's settings
//
// ln -s ./user.js ~/.mozilla/firefox/xxxxxxxx.default-release/user.js
// ln -s ./chrome/ ~/.mozilla/firefox/xxxxxxxx.default-release/chrome/

/* disable about:config warning */
user_pref("browser.aboutConfig.showWarning", false);

/* enable userChrome */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("layout.css.color-mix.enabled", true);
