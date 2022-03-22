<!DOCTYPE html>
<html>
    <head>
            <link rel="stylesheet" href="html/botstrap_css/bootstrap.min.css">
            <script src="html/materialize/js/materialize.min.js"></script>
            <title>Weeb Company</title>
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="#">
                <img src="html/botstrap_css/logo.jpg" width="30" height="30" alt="">
                 <b>Weeb Company</b> 
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
              <ul class="navbar-nav">
                <li class="nav-item">
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button" class="btn btn-danger"><a class="nav-link" href="#Introduction">Introduction</a></button>
                        <button type="button" class="btn btn-danger"><a class="nav-link" href="#OurCustomers">Our Customers</a></button>
                        <button type="button" class="btn btn-danger"><a class="nav-link" href="#OurAdministration">Our Administration</a></button>
                        <button type="button" class="btn btn-danger"><a class="nav-link" href="#SearchEmployer">SearchEmployer</a></button>
                        <button type="button" class="btn btn-danger"><a class="nav-link" href="#AboutUs">About Us</a></button>
                    </div>
                </li>
              </ul>
            </div>
          </nav>
          <div id="Introduction" class="container-fluid bg-success" style="padding-top:100px;padding-bottom:100px">
              <div class="row">
                <div class="col-6 col-md-4">
                </div>
                <div class="col-6 col-md-4">
                <h1 class="text-dark">Introduction</h1>
                   <p>Welcome to the Weeb company, you can scroll down to see all the information options our site have for you.
                      We are basically friends for rent. We hang out with you and play all JRPG games.Ever wanted a friend to talk about all the anime in the world well 
                      just hit us up.For fifty bucks an hour we be all the fun anime japanese obsessed loving friend you would ever have.
                      We will cosplay with you and even reenact your favorite anime scenes.
                    </p>
                </div>
                <div class="col-6 col-md-4">
                </div>
              </div>
            </div>
            <div id="OurCustomers" class="container-fluid bg-warning" style="padding-top:100px;padding-bottom:100px">
                <div class="row">
                    <div class="col-6 col-md-4">
                    </div>
                    <div class="col-6 col-md-4">
                    <h1 class="text-dark">Our Customers</h1>
                       <p>We satisfy a niche group of people, people who are extremely obsessed with the japanese
                        culture and  people who are heavily influenced by the anime genre. We understand that this
                        hobbies a appeal to a very slim minority of people and sometimes it could be hard to get friends
                        who are just as interested in the as you are. Thus is you are a frequent anime expo goer and
                        need people to go with you or if you simply just wanna have a team to help build you cosplay,
                        are exactly the kind of person we serve. We also serve as online friends of JRPG games or 
                        anime jeopardy.hence if you are looking for these services you are our customer.
                      </p>
                    </div>
                    <div class="col-6 col-md-4">
                    </div>
                  </div>
            </div>
            <div id="OurAdministration" class="container-fluid bg-light" style="padding-top:100px;padding-bottom:100px">
                <div class="row">
                    <div class="col-6 col-md-4">
                    </div>
                    <div class="col-6 col-md-4">
                    <h1 class="text-dark">Our Administration</h1>
                       <p>We have very laxed board of trustees “ourselves” so as you can imagine management is pretty laxed. 
                         Every employee is ranked differently just like any other company we have manager and supervisors. 
                         But all this are really just job titles as we try very much not have a very corporate setting. We are in the business of being friends with people ultimately that 
                         has to start with us and our interactions in the company. It is also important  to note that no one is off limit anybody supervisor, manager can all
                         be hired by you the customer. This is why we have a section bellow to help you  search our employee database so you can get some basic information about 
                         them before you hire.
                      </p>
                    </div>
                    <div class="col-6 col-md-4">
                    </div>
                  </div>
            </div>
            <div id="SearchEmployer" class="container-fluid bg-info" style="padding-top:100px;padding-bottom:100px">
                <div class="row">
                    <div class="col-6 col-md-4">
                    </div>
                    <div class="col-6 col-md-4">
                    <h1 class="text-dark">SearchEmployer</h1>
                          <div class="row align-items-center ">
                              <div class="col-4 col-md-4">

                                  <table class="table table-borderless table-hover">
                                      <thead>
                                        <tr>
                                          <th>Lastnames</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <td>Smith</td>
                                        </tr>
                                          <td>Wong</td>
                                        </tr>
                                        <tr>
                                          <td>English</td>
                                        </tr>
                                        <tr>
                                          <td>Narayan</td>
                                        </tr>
                                        <tr>
                                          <td>Borg</td>
                                        </tr>
                                        <tr>
                                          <td>Wallace</td>
                                        </tr>
                                        <tr>
                                          <td>Jabber</td>
                                        </tr>
                                        <tr>
                                          <td>Zelaya</td>
                                        </tr>
                                      </tbody>
                                    </table>
                              </div>
                              <div class="col-4 col-md-8">
                                  <form method="post" action="search.php?go" id="searchform">
                                      <div class="form-group">
                                        <label for="Search"><b>Search</b></label>
                                        <input type="text" name="name" class="form-control" id="search" aria-describedby="search tip" placeholder="Lastname">
                                        <small id="search tip" class="form-text text-muted">search employees lastname from the list here</small>
                                      </div>
                                      
                                      <button type="submit" class="btn btn-success" action="search.php?go" value="Search">Submit</button>
                                    </form>     
                              </div>
                          </div>
                    </div>

                    <div class="col-6 col-md-4">
                    </div>
                  </div>
            </div>
            <div id="AboutUs" class="container-fluid bg-primary" style="padding-top:100px;padding-bottom:100px">
                <div class="row">
                    <div class="col-6 col-md-4">
                    </div>
                    <div class="col-6 col-md-4">
                    <h1 class="text-white">About Us</h1>
                       <p>We deputed in 2019, we were originally a bunch of loser who did nothing but eat and play video games. 
                          We were good at it too so we decided why not put our skills to good use and hang with people just like us for money at least.
                          <br> <b>Contact Information</b>
                          <br> <b>Our email:</b> weebLoVE@anime.com
                          <br> <b>instagram:</b> @ANimeWEEB
                      </p>
                    </div>
                    <div class="col-6 col-md-4">
                    </div>
                  </div>
            </div>
            
           
      <script src="html/Bootstrp_js/Jq.js"></script>
      <script src="html/Bootstrp_js/popper.min.js"></script>
      <script src="html/Bootstrp_js/bootstrap.min.js"></script>
    </body>

</html>