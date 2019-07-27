.TL
CM4025 Design Document
.AU
Shaw Eastwood
.AI
Robert Gordon University

.NH
SQL DB
.PP
design will require a number of tables i
.TS
center tab(;);
c s s s s
c | c | c | c | c.
users
userid;username;password;created;seen
001;Ted;$2y$10$IXG0XcqEbvef7AbZaemrMu;2019-04-11 23:22;2019-04-11 23:27
002;Bob;$2y$10$RPSlPNyYfx16NVTh7OstOl;2019-04-11 23:40;2019-04-11 23:41
.TE
.PP
The user table contains the list of users, with there passwords hashed.
The last
.B "seen"
field will allow us to highlight articles released since the users last login.
.TS
center tab(;);
c s s s s
c | c | c | c | c.
feeds
id;title;description;url;updated
001;Latest From Luke;Lorem ipsum dolor set amet...;lukesmith.xyz/rss.xml;2019-03-11 23:40
.TE
.PP
A feeds table containing all the information of the feed.
This table is shared among all users and the
.B "subscriptions"
table later on is used to link a user to his subscription.
.TS
center tab(;);
c s s s s s s
c | c | c | c | c | c.
Articles
id;feed_id;title;url;published;summary
001;001;Tagging Ogg files?;lukesmith.xyz/2019.html;10-04/2019 18:17;...;
.TE
.PP
A table containing all of the articles and the information pertaining to it.
Note the replacement of the
.B "description"
of the article with
.B "summary"
as the description is the entire contents and this does not need to be stored.
This information isstored for the purposes of caching later on, and it will allow it allow for far easier, and server side, sorting of the articles to show chronologically.
.TS
center tab(;);
c s s
c | c | c.
Subscriptions
id;user_id;feed_id
001;001;001
002;002;001
.TE
.PP
Whereas the subscriptions table will take this form.
The
.B "user_id"
and the
.B "feed_id"
being fk links to the respective tables and allowning us to track who is subscribed to what.

.bp
.NH
Interface Design
.PP

.bp
.NH
API Design
.PP
The program will function following the PAD format with the back-end functioning as a API or handler.
Our PHP code will return JSON formatted strings with no HTML markup provided (unless its part of the RSS feed).
This has the benefit of allowing our front end to be agnostic of the back end and allows changes to how to display it ( or where ) not require modification of the API.
.SH 2
Requesting a feed
.PP
To request a feed from a number of things must happen.
.RS
.RS
.IP \[bu]
The user must be logged in
.IP \[bu]
The user must have subscribed to a feed
.RE
.RE
Upon loading the main page ( or pressing refresh ) the
.CW "getFeed()"
javascript method is called.
This will initiate a
\# TODO : ref this
.CW "fetch" ,
a new
\*{ish\*}
javascript api that operates on promises, and from this we call the
.CW "displayFeed()"
method once we have the complete JSON response from the call.
.PP
For this to work we simply call
.CW "fetch"
on our PHP script location, in this case
.CW "/feedreq.php"
which will handle everything else.
From this file we have two primary functions,
.CW "getFeed"
and
.CW "buildFeed"
and a class
.CW "Article"
which contains the object definition for the articles we will be getting.
The former is a simple handler to accept a $url, iterate through all of the articles in the $url and return them as an array.
The latter handles this by feeding it the $urls from the users subscriptions list which it polls the database for.
Upon receiving them all it curates the articles (simply taking the head (top #)) and returning them as JSON object.
.XP

