/* SIMPLICITY */
user_pref("services.sync.engine.history", false); // Browsing history
user_pref("services.sync.engine.bookmarks", false); // Bookmarks
user_pref("services.sync.engine.tabs", false); // Open tabs
user_pref("services.sync.engine.topSites", false); // Shortcuts / Top sites
user_pref("services.sync.engine.searches", false); // Search engines

user_pref("browser.search.suggest.enabled.private", false); // Disable suggestions in private mode
user_pref("browser.urlbar.suggest.searches", false); // Disable search suggestions in address bar
user_pref("browser.urlbar.recentSearches.enabled", false); // Disable recent searches dropdown
user_pref("browser.urlbar.recentSearches.enabled", false);
user_pref("browser.urlbar.suggest.engines", false);

user_pref("signon.rememberSignons", false);
user_pref("toolkit.telemetry.enabled", false);
// Disable "Fill usernames and passwords automatically"
user_pref("signon.autofillForms", false);

// Disable "Suggest strong passwords"
user_pref("signon.generation.enabled", false);

// Disable "Suggest Firefox Relay email masks"
user_pref("signon.firefoxRelay.feature", false);

// Disable alerts about breached passwords (Firefox Monitor)
user_pref("signon.management.page.breach-alerts.enabled", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.pioneer-new-studies-enabled", false);
user_pref("datareporting.policy.dataSubmissionPolicyBypassNotification", true);

/* THEME */
user_pref("widget.content.gtk-theme-override", "Adwaita-dark");
user_pref("extensions.theme.system-managed", false);
user_pref("browser.in-content.dark-mode", true);
user_pref("ui.systemUsesDarkTheme", 1);
user_pref("font.name.monospace.x-unicode", "FiraCode");
user_pref("font.name.monospace.x-western", "FiraCode");
user_pref("font.name.monospace.x-central-euro", "FiraCode");
user_pref("font.name.monospace.x-cyrillic", "FiraCode");
user_pref("font.name.serif.x-western", "Fira Code");
user_pref("font.name.sans-serif.x-western", "Fira Code");
user_pref("font.name.cursive.x-western", "Fira Code");
user_pref("font.name.fantasy.x-western", "Fira Code");
user_pref("font.name.system-ui.x-western", "Fira Code");
user_pref("font.name-list.serif.x-western", "Fira Code");
user_pref("font.name-list.sans-serif.x-western", "Fira Code");
user_pref("font.name-list.monospace.x-western", "Fira Code");
user_pref("font.name-list.cursive.x-western", "Fira Code");
user_pref("font.name-list.fantasy.x-western", "Fira Code");
user_pref("font.name.serif.x-western", "Fira Code");
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.sanitize.sanitizeOnShutdown", false);

user_pref("font.size.variable.x-western", 16);
user_pref("font.size.fixed.x-western", 14);

user_pref("browser.display.use_document_fonts", 0);
user_pref("font.accessible_to_colorblind", true);
user_pref("zoom.level", 1.1);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("svg.context-properties.content.enabled", true); //for css theme
user_pref("extensions.activeThemeID", "{08d5243b-4236-4a27-984b-1ded22ce01c3}"); //gruvbox theme
user_pref("lightweightThemes.selectedThemeID", "{08d5243b-4236-4a27-984b-1ded22ce01c3}"); //to disable the default theme
