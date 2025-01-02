# New Shipment Viewer

hey! i'm glad you're here :-)

## why?
the old one was a crusty hack on top of zach's warehouse base because it needed to exist (at that time there was no way to see what HQ sent you)

this one kinda maybe looks more like actual usable maintainable software

the constant "why do my high seas orders not show up in there?" -> "because it doesn't have that data because this was a 1-afternoon hackjob" got really irritating so i wrote something new data sources can actually be integrated into
## contributing

PLEASE

airtable creds with read-only access to mock data are in `.env.test`, if you need test cases that aren't covered included pls poke me!

`bundle install` and `dotenvx run -f .env.test -- bundle exec rackup` are probably your friends.

glhf! lmk if you have any questions while working on PRs!

## json api
`shipment-viewer.hackclub.com/dyn/jason/<email>/?signature=<signature>`