.TL
Enterprise Web Systems Notes
.AU
Shaw Eastwood
.DA

.SH
Intro
.LP
points
N-Tier System
PAD
Presentation - HTML & CSS & Javascript
Application - PHP or Node.Js
Data - SQL / NoSQL

.SH 2
Client vs. Server
.LP
Client languages handled by the local system, typically the browser.
Code, be it Javascript or HTML, is obtained in as source.
Parsed
.B "client-side"
by the browser that generates the Document Object Model
.B "DOM" ) (
and displays it.

Server languages are handled on the server and what is the returned is the result of the execution.
Users are only shown the result not the source code that generated it.
A form of Black Box.
Number of advantages from this:
.RS
.IP \[bu]
Access to a shared data resource
.IP \[bu]
Security of execution
.IP \[bu]
Privacy of source code
.RE

.SH 2
What is PHP?
.LP
Personal Hypertext Preprocessor
.B "PHP" ) (
is an open source language designed to handle server side scripting.
As a language is very tightly integrated into the web dynamic and is more suited to dynamic web page generation than more traditional languages of its time.
One of the most widely used server side languages before the rise of Node.js as a server language.
Documents are stored server side and are executed, this returns a result to the client making the request.
PHP is an inherently single threaded language this causes a clear performance bottleneck.

Browser requests the "PHP" file (webpage) which is executed by the interpreter which executes the code in the file, making requests to a database if necessary and returns the resulting "Dynamic Webpage" to the client.

.SH 3
API?
.LP
An Application Programming Interface
.B "API" ) (
is in general terms, it is a set of clearly defined methods of communication among various components.
It serves to abstract a potentially complex number of actions into a single function.
For example moving a file on a file system without needing to know whether its ext4 or NTFS and the nuances of either or when querying a database to handle escaping/prepared statements.
.bp

.SH
N-Tier Architecture
.LP
N-Tier architecture is a client-server architecture in which presentation, application processing, and data management functions are seperated in the code.
The most widespread use of multitier architecture is the three-tier, or
.B "PAD" ,
architecture.
By segregating an application in this way modifying or adding "layers" is trivial without the need to reworking the entire application.

.SH 2
PAD
.LP
The Presentation, Application, Data
.B "PAD" ) (
Architecture break a given system down into three distinct layers which have a distinct function.
.RS
.IP \[bu]
The
.B "Presentation"
layer which handles the User Interface and display of the program.
.IP \[bu]
The
.B "Application"
layer handles the actual processing of the program. Information is retrieved, where needed, from the Data layer and given to the presentation layer.
.IP \[bu]
The
.B "Data"
layer which handles the storage of long term data that spans across sessions.
This is usually handled by a
.B "DBMS" .
.LP
It's used for many reasons such as permitting layers of an application to be substituted and to support parallel development of Enterprise web applications.
.RE

.SH
Data Languages
.LP
The primary languages used to transmit data are JSON and XML, though XML is a much older and a much heavier (more boilerplate) language and is being phased out in favour of JSON.
These languages serve as a universal intermediary for transferring information or data objects between languages.
Most programming languages include JSON and XML parsers that will convert a string to an object which can then be accessed like any other.
One advantage of XML is because it is so verbose it is self documenting.

A JSON or XML document is formed by a hierarchical relationship of elements and tags.
When using this in the sense of a PAD application, the application layer would commonly act as a translator for the data layer.
Converting the returned database query and structuring it into the appropriate document to be sent to the presentation layer  for it to be incorporated into the DOM of the browser.

.SH
SOAP vs. REST
.LP
Simple Object Access Protol
.B "SOAP" ) (
is now antiquated protocol that allowed a client to call methods on a server and request data.
It communicates over the Application Layer utilizing well implemented protocols such as HTTP and less frequently SMTP.
Instructions and data is "encoded" in XML.
The functions a SOAP interface can perform are documented by the WSDL document.
SOAP interfaces are strictly defined and heavily application dependent.

.LP
Representational State Transfer Protocol
.B "REST" ) (
although not a standard is almost ubiquitous and used in most API's on the web.
This popularity is due to is ease of implementation and simplicity.
Again, relying on the HTTP protocol access to it is easy to access with standard GET/POST etc. methods which are well implemented in most languages.

FROM WIKI
Representational State Transfer (REST) is a software architectural style that defines a set of constraints to be used for creating Web services. Web services that conform to the REST architectural style, termed RESTful Web services (RWS), provide interoperability between computer systems on the Internet. RESTful Web services allow the requesting systems to access and manipulate textual representations of Web resources by using a uniform and predefined set of stateless operations. Other kinds of Web services, such as SOAP Web services, expose their own arbitrary sets of operations.[1]

"Web resources" were first defined on the World Wide Web as documents or files identified by their URLs. However, today they have a much more generic and abstract definition that encompasses every thing or entity that can be identified, named, addressed, or handled, in any way whatsoever, on the Web. In a RESTful Web service, requests made to a resource's URI will elicit a response with a payload formatted in HTML, XML, JSON, or some other format. The response can confirm that some alteration has been made to the stored resource, and the response can provide hypertext links to other related resources or collections of resources. When HTTP is used, as is most common, the operations (HTTP methods) available are GET, HEAD, POST, PUT, PATCH, DELETE, CONNECT, OPTIONS and TRACE.[2]

By using a stateless protocol and standard operations, RESTful systems aim for fast performance, reliability, and the ability to grow, by re-using components that can be managed and updated without affecting the system as a whole, even while it is running.

The term representational state transfer was introduced and defined in 2000 by Roy Fielding in his doctoral dissertation.[3][4] Fielding's dissertation explained the REST principles that were known as the "HTTP object model" beginning in 1994, and were used in designing the HTTP 1.1 and Uniform Resource Identifiers (URI) standards.[5][6] The term is intended to evoke an image of how a well-designed Web application behaves: it is a network of Web resources (a virtual state-machine) where the user progresses through the application by selecting resource identifiers such as http://www.example.com/articles/21 and resource operations such as GET or POST (application state transitions), resulting in the next resource's representation (the next application state) being transferred to the end user for their use.
