# Clerks
These are some thoughts and drafts about how the data modeling will work. This
is subject to change and this doc may get out of date.

## Candidates and Committees
Candidates and Committees share a lot of similarities but there are good reasons
to keep them separate. There is a natural distinction when we are displaying
data and rather than have some field that indicates one or the other having
separate tables will create a natural isolation. This should simplify queries.

## Financial Reports
Each schedule financial report will be it's own unique table for now. These all
have similarities but enough differences that creating a mega table with types
would probably add unnecessary complexity. Having to query multiple tables
per candidate and committee could have an io cost, there is probably room for
query optimization in the future.

Each schedule form is a little different between each candidate and committee.
Currently the plan is to have a separate table for each. This may be overkill
and change in the span of development.

## Users
Users are a challenging concept for this app. Is the user a committee or a
candidate. Can a user administer more than one committee or candidate. For now
each committee and each candidate are considered separate users gatekept by
email addresses. When these entities are created we assign them a unique UUID
so that these emails can be changed in the future without losing all of our
data.

## Elections
It would be *valuable* if we could see how candidates and committees spend money
*across* elections. For now it makes sense to isolate candidate/committee
financials by election but if we can find a way to link like entities that
would make for some interesting visuals

## Old and likely outdated modeling diagram
![model relationship diagram](/clerks-diag.png)

## Nathan Snippets
A "committee" is a fund (PAC) that is registered with a town/city to
influence ballot questions or spend money supporting/opposing candidates
 in that town/city. For instance, AirBnB registered a committee in
Portland during 2020 to spend money opposing a ballot question that was
anti-Airbnb. Committee's don't have an association with a candidate, is
what I mean to say.
For our app though, "candidates" and "committees" perform the same
functions, but have slightly different attributes. For example,
committee's won't have "party" or "office". Also, "treasurer" would be
an attribute of a "candidate". Same goes for "committee officers", that
would be an attribute of a "committee." They sound important, but really
 are just form fields like "e-mail" or "title".Both
 "candidates" and "committees" submit nomination papers and campaign
finance reports though, but the form fields are slightly different.
Because "committees" and "candidates" perform the same functions, but
have different forms, it could make sense to associate both with
"candidate_id" if by "candidate" we mean a user who submits forms. Then,
 if a "candidate" "is_committee" that means they are filling out
committee campaign finance forms and are a "committee". Like a subclass
of candidate. Same functions, different attributes, different forms. Not
 sure if my terminology is correct here. We can talk this through via
call this week/soon as well if that would be easier.
