# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name

players = Player.find_or_create_by_email([
    {name: 'Keiran Betteley' , email: 'keiran@carpela.com' },
    {name: 'David Todd' , email: 'David.Todd@routesonline.com' },
    {name: 'Simon Abiero' , email: 'sabiero@vcmllp.com' },
    {name: 'Gregory Wells' , email: 'gregory.wells@flamingogroup.com' },
    {name: 'Ben Litvinoff' , email: 'Ben.Litvinoff@robertwalters.com' },
    {name: 'Joseph Guilfoyle' , email: 'Joseph.Guilfoyle@robertwalters.com' },
    {name: 'Ben Pearce' , email: 'bpearc12@ford.com' },
    {name: 'Diego Sevillano' , email: 'diegosevillano@gmail.com' },
    {name: 'Greg Leech' , email: 'ghleech@hotmail.com' },
    {name: 'Gustavo Feijoo' , email: 'gutofeijoo@hotmail.com' },
    {name: 'Iain Lock' , email: 'iainlock1@gmail.com' },
    {name: 'Ianto Jones' , email: 'ianto-jones@dfid.gov.uk' },
    {name: 'Joseph Leveson' , email: 'joeleveson@hotmail.com' },
    {name: 'Keith Leyland' , email: 'kleyland@shp.org.uk' },
    {name: 'Kieran Millington-COLT' , email: 'Kieran.Millington@colt.net' },
    {name: 'Martyn Byrne' , email: 'martyn.byrne@gmail.com' },
    {name: 'Miles Than-Lu' , email: 'miles.thanlu@cliffordchance.com' },
    {name: 'Neil Taylor' , email: 'neil.taylor@db.com' },
    {name: 'Ollie Bartlett' , email: 'olliejb123@hotmail.co.uk' },
    {name: 'Paul Gooders' , email: 'paul.gooders@gmail.com' },
    {name: 'Rhidian Jones' , email: 'llewjones@gmail.com' },
    {name: 'Scott Thornton' , email: 'sthornton23@gmail.com' },
    {name: 'Seb Ambrosie' , email: 'dr.ambrozie@doctors.org.uk' },
    {name: 'Stuart Summers' , email: 'thebeanmachinelondon@gmail.com' },
    {name: 'summersxsam@hotmail.com' , email: 'summersxsam@hotmail.com' },
    {name: 'Suneil Pal' , email: 'spal@vcmllp.com' },
    {name: 'Tom Pudlo' , email: 'tom_pudlo@yahoo.co.uk' },
    {name: 'Tom Fox' , email: 'tomfox101@gmail.com' },
    {name: 'Veselin Ivanov Dachev' , email: 'veselindachev@gmail.com' },
    {name: 'Navid Varess' , email: 'Navid.Varess@macquarie.com' },
    {name: 'Brightman Yoel' , email: 'yoel.brightman@xlgroup.com' },
    {name: 'Misha Sher' , email: 'mmsher@hotmail.com' },
    {name: 'James Walsh' , email: 'james.walsh@guardian.co.uk' },
    {name: 'Alwx Brightman' , email: 'a.brightman@bouygues-construction.com' },
    {name: 'Richard Hurley' , email: 'Richard.Hurley@rkhib.com' },
    {name: 'Richard Morton' , email: 'rick.rmorton@gmail.com' },
    {name: 'Henry Walton' , email: 'Henrymalcolmwalton@gmail.com' },
    {name: 'Dom Millard' , email: 'Dommillard@hotmail.com' },
    {name: 'David Richardson' , email: 'David.Richardson@robertwalters.com' },
    {name: 'Alex Brightman' , email: 'alex_brightman@yahoo.co.uk' },
    {name: 'Chris Black' , email: 'Christopher.Black@imperial.nhs.uk' },
    {name: 'Eduardo Vasquez' , email: 'egopretium@gmail.com' },
 ])  


 
