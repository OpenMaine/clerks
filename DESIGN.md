# Clerks
These are some thoughts and drafts about how the data modeling will work. This
is subject to change and this doc may get out of date.

## Candidates and Campaigns
Candidates and Campaigns share a lot of similarities but there are good reasons
to keep them separate. There is a natural distinction when we are displaying
data and rather than have some field that indicates one or the other having
separate tables will create a natural isolation. This should simplify queries.

## Financial Reports
Each schedule financial report will be it's own unique table for now. These all
have similarities but enough differences that creating a mega table with types
would probably add unnecessary complexity. Having to query multiple tables
per candidate and campaign could have an io cost, there is probably room for
query optimization in the future.

Each schedule form is a little different between each candidate and campaign.
Currently the plan is to have a separate table for each. This may be overkill
and change in the span of development.

## Users
Users are a challenging concept for this app. Is the user a campaign or a
candidate. Can a user administer more than one campaign or candidate. For now
each campaign and each candidate are considered separate users gatekept by
email addresses. When these entities are created we assign them a unique UUID
so that these emails can be changed in the future without losing all of our
data.

## Elections
It would be *valuable* if we could see how candidates and campaigns spend money
*across* elections. For now it makes sense to isolate candidate/campaign
financials by election but if we can find a way to link like entities that
would make for some interesting visuals

## Old and likely outdated modeling diagram
![model relationship diagram](/clerks-diag.png)
