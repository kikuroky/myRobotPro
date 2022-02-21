## Exercise 1 using Standard Robot Framework

- This script is using [Robot Framework](https://robocorp.com/docs/languages-and-frameworks/robot-framework/basics).
- The script is in (`tasks.robot`) file.
- [Example result in html](https://drive.google.com/file/d/1g743RxrpV528Lo9HS6hJ2uiA2dmMFTZA/view?usp=sharing).

## Exercise 2

1. Create a public gist:
	- Pre-condition(s):
		- User has to login with GitHub account.
	- Step(S):
        	- Go to https://gist.github.com/;
	    	- Type some text on the description textbox;
	    	- Type desired file name on the filename textbox, including format file or extension (e.g. my_file.py);
	    	- Type some texts or syntax code on the main textarea;
	    	- Click button with arrow-down to select gist type, it is small button next to submit button;
	    	- Select and click `Create public gist`;
	    	- Click submit button `Create public gist`.
    Expected result(s):
        - A public gist created successfully;
	    - Path appears to be `{profile_name}/{filename}`;
	    - Number on tab `Revision` is 1.

2. Edit existing gist:
    Pre-condition(s):
        - User has to login using GitHub account;
	    - User has created a public gist beforehand.
    Step(s):
        - Go to https://gist.github.com/;
	    - Click any of existing public gist under the header page;
	    - Click CTA button `Edit`;
	    - Edit the description text, filename with extension, syntax or texts;
	    - Click submit button `Update public gist`.
    Expected result(s):
        - Success to edit public gist;
	    - Number on tab `Revision` is n+1, where n is total number before edit.

3. Delete existing gist:
    Pre-condition(s):
        - User has to login using GitHub account;
	    - User has created a public gist beforehand.
    Step(s):
        - Go to https://gist.github.com/;
	    - Click any of existing public gist under the header page;
	    - Click CTA button `Delete`;
	    - Click `OK` on the confirmation warning message box;
    Expected result(s):
        - Gist deleted successfully;
	    - Redirecting to gist profile page.

4. View list of gists:
    Pre-condition(s):
        - User has to login using GitHub account;
	    - User has created some public gists beforehand.
    Step(s):
        - Go to https://gist.github.com/;
	    - Click CTA text `View your gists`.
    Expected result(s):
        - Redirecting to gist profile page;
	    - Total gists is equal to  the number on title `All gists`.

## Exercise 3

1. [Mock-up API](https://run.mocky.io/v3/c7f7ce9f-148c-47fa-8781-b1c29f0f4863).
2. The script is in (`APItest.js`) file.
3. The script is in (`APItest.js`) file.
4. -    Response code `200` is checked using the correct method, endpoint, payload request data, etc.
    -   Response code `400` occurs when user is using invalid json format, missing some commas or curly-brackets.
    -   Response code `404` will show if user requests using invalid host or endpoint.
    -   Response code `500` can be tested while the server or service is down or just asking DevOps or Infra to shut-down the server or service for a while.

## See more

- [All docs related to Robot Framework](https://robocorp.com/docs/languages-and-frameworks/robot-framework)
- [Mocky API](https://designer.mocky.io/)
- [GitHub Gist](https://gist.github.com/)
