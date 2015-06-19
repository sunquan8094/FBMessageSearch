# FBMessageSearch
This is a UNIX shell script that allows you to search through Facebook messages in the `messages.htm` file within the Facebook personal data downloaded files.

To run on a UNIX terminal, type: 
`fbmsgscript (directory) (regexes)`

`(directory)` is where the messages.htm file is located relative to the root directory. `(regexes)` may consist of multiple expressions separated by spaces. 

Update as of initial commit:
- At the moment, the script will not check if the file matches the template of the HTML file. Support for certain regular expression operators (so far only `|`, as tested) has not been inplemented. Therefore, a precondition is that the file must be named `messages.htm` and that the file is downloaded from Facebook.

Additional Resources:
- Accessing Your Facebook Data: https://www.facebook.com/help/405183566203254

Contact info:
- Email: sunquan8094@gmail.com
