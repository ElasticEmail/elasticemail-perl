# Perl Snippets
Snippets prepared for Perl.

## Prepare test environment
Clone this repository and install the dependencies from the `cpanfile`:

```bash
git clone https://github.com/ElasticEmail/elasticemail-perl.git
cd elasticemail-perl
cpanm --installdeps .
```

## Prepare a snippet
Edit snippet and put your api key in place of `YOUR_API_KEY`

Replace other data if needed eg.: 
- your validated email address, 
- your email address to receive example email.
- template name
- campaign name
- ...etc

## Running a snippet
From the repository root, run

`perl -Ilib examples/functions/snippetFile.pl`
