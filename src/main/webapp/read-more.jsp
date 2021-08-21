<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Binh Hu Blog</title>
    <meta charset="utf-8"/>

    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />
    <script src="jquery-3.5.1.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="css/layout.css" rel="stylesheet" type="text/css" media="all"/>
    <link
            href="css/fontawesome-all.min.css"
            rel="stylesheet"
            type="text/css"
            media="all"
    />
    <link
            href="css/framework.css"
            rel="stylesheet"
            type="text/css"
            media="all"
    />

    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />
    <link
            href="css/OverWrite.css"
            rel="stylesheet"
            type="text/css"
            media="all"
    />
    <style>
        .row:after {
            content: "";
            display: table;
            clear: both;
        }
        .column {
            float: left;
            width: 50%;
        }
    </style>
</head>
<body id="top">
<div class="wrapper row0">
    <div id="topbar" class="hoc clear">
        <ul class="nospace">
            <li>
                <a href="index.html" title="Home"><i class="fas fa-home"></i></a>
            </li>
            <li>
                <a href="https://mail.google.com/" title="Send a Mail"><i class="far fa-envelope"></i></a>
            </li>
            <li>
                <a href="https://www.google.com/" title="Help Centre"><i class="far fa-life-ring"></i></a>
            </li>
            <li>
                <a href="register-blog" title="Register Here"><i class="fas fa-sign-in-alt"></i></a>
            </li>
            <li>
                <a href="login-blog" title="Sign In Here"><i class="fas fa-edit"></i></a>
            </li>
        </ul>
    </div>
</div>

<div class="wrapper row1">
    <header id="header" class="hoc clear">
        <section>
            <div id="my-img">
                <img
                        id="logo-img"
                        src="resources/logo.jpg"
                        alt="logo"
                        style="height: 12em"
                />
            </div>
            <div>
                <h1 id="logo">
                    <i class="fas fa-dove"></i> <a href="home">Binh Hu</a>
                </h1>
            </div>
            <div>
                <form class="clear" method="post" action="#">
                    <fieldset>
                        <legend>Search:</legend>
                        <input
                                type="search"
                                value=""
                                placeholder="Search Here&hellip;"
                        />
                        <button class="fas fa-search" type="submit" title="Search">
                            <em>Search</em>
                        </button>
                    </fieldset>
                </form>
            </div>
        </section>
    </header>
</div>

<div class="wrapper row2">
    <nav id="mainav" class="hoc clear">
        <ul class="clear">
            <li class="active"><a href="home">Home</a></li>

            <li>
                <a class="drop" href="#">Service</a>
                <ul>
                    <li><a href="#">Service 1</a></li>

                    <li><a href="#">Service 2</a></li>
                </ul>
            </li>
            <li><a href="login-blog">Login to Enjoy with us</a></li>

        </ul>

        <form action="#"><select onchange="location = this.value;">
            <option selected="selected" value=""> - Choose Menu -</option>


            <option value="http://localhost:8089/login-blog">Login Now</option>
            <option value="http://localhost:8089/register-blog">Register</option>


        </select></form>
    </nav>
</div>

<div
        id="pageintro"
        class="wrapper row1 bgded"
        style="background-image: url('resources/background1.jpeg'); height: 55em"
>
    <figure class="hoc clear">
        <figcaption class="heading">What is the life?</figcaption>
        <img src="resources/background.jpg" alt="back" style="width: 53em;height: 34em;   "/>
    </figure>
</div>

<div class="wrapper row3">
    <main class="hoc container clear">
        <!-- main body -->

        <div class="sectiontitle">
            <h6 class="heading">Come Binh Hu Blog to enjoy!</h6>
            <p>We have any thing you need to do anything you want!</p>
        </div>
        <ul id="services" class="nospace group">
            <li class="one_third">
                <article>
                    <h6 class="heading">
                        <i class="fas fa-certificate"></i>
                        <a href="#">Always be your self!</a>
                    </h6>
                    <p>
                        Learn anything you need for the job, favorite future and
                        more at my website[&hellip;]

                    </p>
                    <footer>
                        <a href="#">View Details <i class="fas fa-angle-right"></i></a>
                    </footer>
                </article>
            </li>
            <li class="one_third">
                <article>
                    <h6 class="heading">
                        <i class="fas fa-chess-king"></i>
                        <a href="#">You are the boss here!</a>
                    </h6>
                    <p>
                        Anything, if you need, i can give you, uou feel unhappy?
                        Don't worry about that![&hellip;]

                    </p>
                    <footer>
                        <a href="#">View Details <i class="fas fa-angle-right"></i></a>
                    </footer>
                </article>
            </li>
            <li class="one_third">
                <article>
                    <h6 class="heading">
                        <i class="fas fa-fighter-jet"></i>
                        <a href="#">We can go faster </a>
                    </h6>
                    <p>
                        In the website, we can learn and shared anythings in honesty,
                        so why you still scary?[&hellip;]

                    </p>
                    <footer>
                        <a href="#">View Details <i class="fas fa-angle-right"></i></a>
                    </footer>
                </article>
            </li>
        </ul>
        <footer class="center">
            <a class="btn" href="#"
            >Learn more and more <i class="fas fa-angle-right"></i
            ></a>
        </footer>

        <!-- / main body -->
        <div class="clear"></div>
    </main>
</div>

<div class="wrapper bgded overlay"
     style="background-image: url('resources/background_active.jpg');opacity: 0.7;">
    <section id="introblocks" class="hoc container clear">
        <div class="sectiontitle">
            <h6 class="heading"> Our Outstanding Activity Recently</h6>
            <p>
                We always change to be able with anything fo the life
            </p>
        </div>
        <ul class="nospace group">
            <li class="one_third first">
                <article>
                    <a href="#"><i class="fas fa-lemon"></i></a>
                    <h6 class="heading">Drink lemon juice!</h6>
                    <p>
                        Every week in the afternoon, we usually hang out and take the lemon juice[&hellip;]
                    </p>
                    <footer>
                        <a class="btn" href="#"
                        >Read More <i class="fas fa-angle-right"></i
                        ></a>
                    </footer>
                </article>
            </li>
            <li class="one_third">
                <article>
                    <a href="#"><i class="fas fa-street-view"></i></a>
                    <h6 class="heading">Play hide and seek</h6>
                    <p>
                        In the activity is play hide and seek, it like a child but we like that [&hellip;]
                    </p>
                    <footer>
                        <a class="btn" href="#"
                        >Read More <i class="fas fa-angle-right"></i
                        ></a>
                    </footer>
                </article>
            </li>
            <li class="one_third">
                <article>
                    <a href="#"><i class="fas fa-volleyball-ball"></i></a>
                    <h6 class="heading">Play volleyballs</h6>
                    <p>
                        In the beach, we always do that anytime we have, it's good for your healthy [&hellip;]
                    </p>
                    <footer>
                        <a class="btn" href="#"
                        >Read More <i class="fas fa-angle-right"></i
                        ></a>
                    </footer>
                </article>
            </li>
        </ul>
    </section>
</div>

<div class="wrapper row3">
    <section class="hoc container clear">
        <div class="sectiontitle">
            <h6 class="heading">Here is our member blog</h6>
            <p>
                You can enjoy at anything in here, more and more
            </p>
        </div>
        <div id="latest_1" class="group">
            <div class="row" style="width: 81%;margin-left: 25em;">

                    <div class="column">
                        <article style="margin-bottom: 5em">
                            <a class="imgover" href="#">
                                <img style="width: 546px; height: 410px" src="${user.img_path}" alt="image"/>
                            </a>
                            <div class="excerpt">
                                <h6 class="heading">${user.title}</h6>
                                <p>${user.img_dres} </p>
                                <p>${user.content}</p>
                                <div class="clear">

                                    <ul class="nospace meta fl_left">
                                        <li><i class="fas fa-user"></i> <a href="#">By User ID: ${user.idUser} </a></li>
                                        <li><i class="fas fa-tag"></i> <a href="#">Tag Name</a></li>
                                        <li>Create at:  ${user.createday} </li>
                                    </ul>
                                </div>
                            </div>
                        </article>
                    </div>

            </div>

        </div>
        <br><br>

    </section>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="home">Back to home</a></li>

            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </nav>
</div>


<div class="wrapper row4">
    <footer id="footer" class="hoc clear">
        <div class="one_half first">
            <ul class="nospace linklist contact">
                <li>
                    <i class="fas fa-map-marker-alt"></i>
                    <address>Hue &amp; Huong Long 6654-854</address>
                </li>
                <li><i class="fas fa-phone"></i> 036 550 3545</li>
                <li><i class="fas fa-fax"></i> 036 550 3545</li>
                <li><i class="far fa-envelope"></i> nguyenvanthaibinh2210@gmail.com</li>
            </ul>
        </div>
        <div class="one_quarter">
            <h6 class="heading">Or you can contact with me at</h6>
            <ul class="nospace linklist">
                <li><a href="#">FaceBook</a></li>
                <li><a href="#">Instagram</a></li>
            </ul>
        </div>
        <div class="one_quarter">
            <h6 class="heading">We always waiting for you!</h6>
            <p class="nospace btmspace-30">
                Don't me shy to come with us, you can do any thing!
            </p>
        </div>
    </footer>
</div>


<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="script/jquery.backtotop.js"></script>
<script>
    $(document).ready(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 150) {
                $('#backtotop').fadeIn();
            } else {
                $('#backtotop').fadeOut();
            }
        });

        $('#backtotop ').click(function () {
            $("html, body").animate({
                scrollTop: 0
            }, 1000);
            return false;
        });
    });
</script>

</body>
</html>
