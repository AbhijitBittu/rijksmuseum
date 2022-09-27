*** Variables ***
${accept_Cookie}=  xpath=//div[@class="cookie-consent-bar"]/div[2]/button[1]
${login_link}=   xpath=//ul[@class="header-links header-options"]/li[2]/a
${sign-up}=  //div[@class="mini-page bg-lighter"]/div/p/a
${username}=  //input[@id="register_name"]
${email}=  //input[@id="register_email"]
${password1}=   //input[@id="register_password"]
${password2}=   //input[@id="register_password2"]
${newsletter}=  //input[@id="signupfornewsletter"]
${sign-up-submit}=  //button[@type="submit"]
${loginEmail}=  //input[@id="email"]
${loginPassword}=  //input[@id="wachtwoord"]
${rijksstudioButton}=  //ul[@class="header-links header-links-left"]/li[5]/a
${image_Johannes}=  //*[contains(text(),"Johannes Vermeer")]//parent::h3//parent::figcaption//parent::figure//child::a[@class="set"]
${collection_heart1}=  //div[@id="infinite-scroll-page-results"]/figure[1]/div/a[2]
${addMyCollection}=  //a[contains(text(),"My first collection")]
${closePopUp}=   //div[@data-role="lightbox-first-time-added"]//button[@data-role="lightbox-close"]
${navigateToCollection}=  //li[@class="user-profile"]//div[@class="avatar-placeholder"]
${getStarted}=   //div[@data-role="lightbox-container"]//nav[@class="box reset-padding-top"]/div[2]/ul/li[3]/button[@data-role="lightbox-close"]
${imgURL1}=  //div[@id="infinite-scroll-page-results"]/figure[1]/div/a/figure/img
${imgURL2}=  //figure[@class="brick"]/a/div/div/img
${searchButton}=  //a[contains(text(),"Search Rijksstudio")]
${advancedSearch}=  //a[contains(text(),"Advanced search")]
${searchFor}=   //input[@id="advanced-search-field"]
${SearchTitle}=   //input[@id="QueryDescriptor_AdvancedSearchOptions_ObjectCriteria_Title"]
${SearchStartDate}=   //input[@id="QueryDescriptor_AdvancedSearchOptions_ObjectCriteria_DatingPeriod_StartDate"]
${SearchEndDate}=   //input[@id="QueryDescriptor_AdvancedSearchOptions_ObjectCriteria_DatingPeriod_EndDate"]
${onlyWithImage}=    //input[@id="QueryDescriptor_AdvancedSearchOptions_ObjectCriteria_ShowImage"]
${submit}=  //input[@type="submit"]



