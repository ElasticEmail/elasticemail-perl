# Perl Snippets
Snippets prepared for Perl.

## Prepare test environment outside this repo
Download our ElasticEmail-WebApiClient (https://github.com/ElasticEmail/ElasticEmail.WebApiClient.perl) and our library https://github.com/ElasticEmail/elasticemail-perl/tree/master/lib/ElasticEmail.

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test
	make install
    
## Prepare a snippet
Edit snippet and put your api key in place of `YOUR_API_KEY`

Replace other data if needed eg.: 
- your validated email address, 
- your email address to receive example email.
- template name
- campaign name
- ...etc

## Running a snippet
Run

`cd perl_snippets`

`perl functions/snippetFile.pl`

