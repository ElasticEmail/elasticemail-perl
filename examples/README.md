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
Every snippet reads your API key from the `ELASTICEMAIL_API_KEY` environment variable and stops with an error if it is not set:

```bash
export ELASTICEMAIL_API_KEY=your-api-key
```

Replace other data if needed eg.: 
- your validated email address, 
- your email address to receive example email.
- template name
- campaign name
- ...etc

## Running a snippet
From the repository root, run

`perl -Ilib examples/functions/snippetFile.pl`

## Snippets

| Snippet | Readme |
| --- | --- |
| [addCampaign](functions/addCampaign.pl) | [readme](functions/addCampaign.md) |
| [addBulkContacts](functions/addBulkContacts.pl) | [readme](functions/addBulkContacts.md) |
| [addList](functions/addList.pl) | [readme](functions/addList.md) |
| [addSingleContact](functions/addSingleContact.pl) | [readme](functions/addSingleContact.md) |
| [addTemplate](functions/addTemplate.pl) | [readme](functions/addTemplate.md) |
| [deleteCampaign](functions/deleteCampaign.pl) | [readme](functions/deleteCampaign.md) |
| [deleteContact](functions/deleteContact.pl) | [readme](functions/deleteContact.md) |
| [deleteContacts](functions/deleteContacts.pl) | [readme](functions/deleteContacts.md) |
| [deleteList](functions/deleteList.pl) | [readme](functions/deleteList.md) |
| [deleteTemplate](functions/deleteTemplate.pl) | [readme](functions/deleteTemplate.md) |
| [exportContacts](functions/exportContacts.pl) | [readme](functions/exportContacts.md) |
| [loadCampaign](functions/loadCampaign.pl) | [readme](functions/loadCampaign.md) |
| [loadCampaigns](functions/loadCampaigns.pl) | [readme](functions/loadCampaigns.md) |
| [loadCampaignsStats](functions/loadCampaignsStats.pl) | [readme](functions/loadCampaignsStats.md) |
| [loadChannelsStats](functions/loadChannelsStats.pl) | [readme](functions/loadChannelsStats.md) |
| [loadList](functions/loadList.pl) | [readme](functions/loadList.md) |
| [loadStatistics](functions/loadStatistics.pl) | [readme](functions/loadStatistics.md) |
| [loadTemplate](functions/loadTemplate.pl) | [readme](functions/loadTemplate.md) |
| [sendBulkEmails](functions/sendBulkEmails.pl) | [readme](functions/sendBulkEmails.md) |
| [sendTransactionalEmails](functions/sendTransactionalEmails.pl) | [readme](functions/sendTransactionalEmails.md) |
| [updateCampaign](functions/updateCampaign.pl) | [readme](functions/updateCampaign.md) |
| [uploadContacts](functions/uploadContacts.pl) | [readme](functions/uploadContacts.md) |
