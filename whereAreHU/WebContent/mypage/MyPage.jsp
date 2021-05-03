<%@page import="model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<script>

	
	$(function(){
		 tabBtn = document.querySelectorAll(".nav ul li");
		 tab = document.querySelectorAll(".tab");
		 
		 bio = document.querySelector(".bio");
		 bioMore = document.querySelector("#see-more-bio");
		 //bioLength = bio.innerText.length;
		 
		 $(".nav ul li").click(function() { 
			  $(this)
			    .addClass("active")
			    .siblings()
			    .removeClass("active");
		});
		
		 
	});

	

	function tabs(panelIndex) {
		//alert(panelIndex);
		//console.log(tab[panelIndex]);
		/*
	    tab.forEach(function(node) {
	   		node.style.display = "none";
	 
	    }); 
	  tab[panelIndex].style.display = "block";
	*/
	  //bioText();
	  //if (document.querySelector(".alert-message").innerText > 9) {
		//  document.querySelector(".alert-message").style.fontSize = ".7rem";
		//}
	  
	   
	  
	//회원정보 수정 하는 AJAX (0)
	  if(panelIndex==0){
		  $.ajax({
			  url:"changeByUserList",
			 
			  success:function(responseData){
				
				  $("#here").html(responseData);
			  }
		  });
	  }
	  
	  //리뷰 조회 리스트 끌어다 오는 AJAX (1)
	  else if(panelIndex==1){
		  $.ajax({
			  url:"reviewByUserList",
			  data: {"user_id":"${user_id}"},
			  success:function(responseData){
				
				  $("#here").html(responseData);
			  }
		  });
	  }
	  
	//좋아요 조회 리스트 끌어다 오는 AJAX (2)
	else if(panelIndex==2){
		  $.ajax({
			  url:"GoodByUserList",
			  data: {"user_id":"${user_id}"},
			  success:function(responseData){
				  
				  $("#here").html(responseData);
			  }
		  });
	  }
	
	//회원탈퇴 하는 AJAX (3)
	else if(panelIndex==3){
		  $.ajax({
			  url:"Deleteuser",
			  data: {"user_id":"${user_id}"},
			  success:function(responseData){
				 
				  $("#here").html(responseData);
			  }
		  });
	  }
	
	 
	
	
	}
	
	
	
	
	
	
	
 
	

	function bioText() {
	   
	  bio.oldText = bio.innerText;

	  bio.innerText = bio.innerText.substring(0, 100) + "...";
	  bio.innerHTML += `<span onclick='addLength()' id='see-more-bio'>See More</span>`;
	}
//	        console.log(bio.innerText)

	

	function addLength() {
	  bio.innerText = bio.oldText;
	  bio.innerHTML +=
	    "&nbsp;" + `<span onclick='bioText()' id='see-less-bio'>See Less</span>`;
	  document.getElementById("see-less-bio").addEventListener("click", () => {
	    document.getElementById("see-less-bio").style.display = "none";
	  });
	}
	

</script>
	
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>

<style>
#header h1 {
			font-weight: 900;
			margin: 0;
		}

			#header h1 span {
				font-weight: 300;
			}

		#header nav {
			letter-spacing: 0.075em;
			position: absolute;
			right: 1.5em;
			text-transform: uppercase;
			top: 0.75em;
		}

			#header nav ul {
				list-style: none;
				padding-left: 0;
			}

				#header nav ul li {
					display: inline-block;
					margin-left: 1.5em;
					padding-left: 0;
				}

					#header nav ul li > ul {
						display: none;
					}

					#header nav ul li a {
						border: solid 1px transparent;
						color: inherit;
						display: inline-block;
						line-height: 1em;
						padding: 0.6em 0.75em;
						text-decoration: none;
					}

					#header nav ul li input[type="button"],
					#header nav ul li input[type="submit"],
					#header nav ul li input[type="reset"],
					#header nav ul li button,
					#header nav ul li .button {
						font-size: 1em;
						min-width: 0;
						width: auto;
					}

					#header nav ul li.submenu > a {
						text-decoration: none;
					}

						#header nav ul li.submenu > a:before {
							-moz-osx-font-smoothing: grayscale;
							-webkit-font-smoothing: antialiased;
							display: inline-block;
							font-style: normal;
							font-variant: normal;
							text-rendering: auto;
							line-height: 1;
							text-transform: none !important;
							font-family: 'Font Awesome 5 Free';
							font-weight: 900;
						}

						#header nav ul li.submenu > a:before {
							content: '\f107';
							margin-right: 0.65em;
						}

					#header nav ul li.active > a, #header nav ul li:hover > a {
						-moz-transition: all 0.2s ease-in-out;
						-webkit-transition: all 0.2s ease-in-out;
						-ms-transition: all 0.2s ease-in-out;
						transition: all 0.2s ease-in-out;
						background: rgba(188, 202, 206, 0.15);
					}

					#header nav ul li.current > a {
						font-weight: 900;
					}

		#header.reveal {
			-moz-animation: reveal-header 0.5s;
			-webkit-animation: reveal-header 0.5s;
			-ms-animation: reveal-header 0.5s;
			animation: reveal-header 0.5s;
		}

		#header.alt {
			-moz-animation: none;
			-webkit-animation: none;
			-ms-animation: none;
			animation: none;
			background: transparent;
			box-shadow: none;
			color: #fff;
			padding: 2em 2.5em;
			position: absolute;
		}

			#header.alt nav {
				right: 2.5em;
				top: 1.75em;
			}

				#header.alt nav ul li.active > a, #header.alt nav ul li:hover > a {
					border: solid 1px;
				}



	.dropotron {
		list-style: none;
		padding-left: 0;
		background: #fff;
		box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.075);
		line-height: 2.25em;
		min-width: 13em;
		padding: 1em 0;
		text-transform: uppercase;
		margin-top: calc(-1em + 1px);
	}

		.dropotron.level-0 {
			font-size: 0.7em;
			font-weight: 400;
			margin-top: 1.5em;
		}

			.dropotron.level-0:before {
				border-bottom: solid 0.5em #fff;
				border-left: solid 0.5em transparent;
				border-right: solid 0.5em transparent;
				content: '';
				left: 0.75em;
				position: absolute;
				top: -0.45em;
			}

		.dropotron > li {
			border-top: solid 1px rgba(124, 128, 129, 0.2);
			padding-left: 0;
		}

			.dropotron > li > a {
				-moz-transition: none;
				-webkit-transition: none;
				-ms-transition: none;
				transition: none;
				color: inherit;
				text-decoration: none;
				padding: 0 1em;
				border: 0;
			}

			.dropotron > li:hover > a {
				background: #83d3c9;
				color: #fff;
			}

			.dropotron > li:first-child {
				border-top: 0;
			}
			*:before, *:after {
    		box-sizing: inherit;
			}
			#header nav ul li a {
		    border: solid 1px transparent;
		    /* color: inherit; */
		    /* display: inline-block; */
		    line-height: 1em;
		    padding: 0.6em 0.75em;
		    text-decoration: none;
			
			}
			
			#header nav ul li.submenu > a:before {
		    content: '\f107';
		    margin-right: 0.65em;
			}
			
			#header nav ul li.submenu > a:before {
		    -moz-osx-font-smoothing: grayscale;
		    -webkit-font-smoothing: antialiased;
		    display: inline-block;
		    font-style: normal;
		    font-variant: normal;
		    text-rendering: auto;
		    line-height: 1;
		    text-transform: none !important;
		    font-family: 'Font Awesome 5 Free';
		    font-weight: 900;
		    
		    @-moz-keyframes reveal-header {
		0% {
			top: -5em;
		}

		100% {
			top: 0;
		}
	}

	@-webkit-keyframes reveal-header {
		0% {
			top: -5em;
		}

		100% {
			top: 0;
		}
	}

	@-ms-keyframes reveal-header {
		0% {
			top: -5em;
		}

		100% {
			top: 0;
		}
	}

	@keyframes reveal-header {
		0% {
			top: -5em;
		}

		100% {
			top: 0;
		}
	}

	#header {
		background: #fff;
		box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.075);
		color: inherit;
		cursor: default;
		font-size: 0.8em;
		left: 0;
		padding: 1em 1.5em;
		position: fixed;
		top: 0;
		width: 100%;
		z-index: 10000;
	}

		#header h1 {
			font-weight: 900;
			margin: 0;
		}

			#header h1 span {
				font-weight: 300;
			}

		#header nav {
			letter-spacing: 0.075em;
			position: absolute;
			right: 1.5em;
			text-transform: uppercase;
			top: 0.75em;
		}

			#header nav ul {
				list-style: none;
				padding-left: 0;
			}

				#header nav ul li {
					display: inline-block;
					margin-left: 1.5em;
					padding-left: 0;
				}

					#header nav ul li > ul {
						display: none;
					}

					#header nav ul li a {
						border: solid 1px transparent;
						color: inherit;
						display: inline-block;
						line-height: 1em;
						padding: 0.6em 0.75em;
						text-decoration: none;
					}

					#header nav ul li input[type="button"],
					#header nav ul li input[type="submit"],
					#header nav ul li input[type="reset"],
					#header nav ul li button,
					#header nav ul li .button {
						font-size: 1em;
						min-width: 0;
						width: auto;
					}

					#header nav ul li.submenu > a {
						text-decoration: none;
					}

						#header nav ul li.submenu > a:before {
							-moz-osx-font-smoothing: grayscale;
							-webkit-font-smoothing: antialiased;
							display: inline-block;
							font-style: normal;
							font-variant: normal;
							text-rendering: auto;
							line-height: 1;
							text-transform: none !important;
							font-family: 'Font Awesome 5 Free';
							font-weight: 900;
						}

						#header nav ul li.submenu > a:before {
							content: '\f107';
							margin-right: 0.65em;
						}

					#header nav ul li.active > a, #header nav ul li:hover > a {
						-moz-transition: all 0.2s ease-in-out;
						-webkit-transition: all 0.2s ease-in-out;
						-ms-transition: all 0.2s ease-in-out;
						transition: all 0.2s ease-in-out;
						background: rgba(188, 202, 206, 0.15);
					}

					#header nav ul li.current > a {
						font-weight: 900;
					}

		#header.reveal {
			-moz-animation: reveal-header 0.5s;
			-webkit-animation: reveal-header 0.5s;
			-ms-animation: reveal-header 0.5s;
			animation: reveal-header 0.5s;
		}

		#header.alt {
			-moz-animation: none;
			-webkit-animation: none;
			-ms-animation: none;
			animation: none;
			background: transparent;
			box-shadow: none;
			color: #fff;
			padding: 2em 2.5em;
			position: absolute;
		}

			#header.alt nav {
				right: 2.5em;
				top: 1.75em;
			}

				#header.alt nav ul li.active > a, #header.alt nav ul li:hover > a {
					border: solid 1px;
				}

/* Dropotron */

	.dropotron {
		list-style: none;
		padding-left: 0;
		background: #fff;
		box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.075);
		line-height: 2.25em;
		min-width: 13em;
		padding: 1em 0;
		text-transform: uppercase;
		margin-top: calc(-1em + 1px);
	}

		.dropotron.level-0 {
			font-size: 0.7em;
			font-weight: 400;
			margin-top: 1.5em;
		}

			.dropotron.level-0:before {
				border-bottom: solid 0.5em #fff;
				border-left: solid 0.5em transparent;
				border-right: solid 0.5em transparent;
				content: '';
				left: 0.75em;
				position: absolute;
				top: -0.45em;
			}

		.dropotron > li {
			border-top: solid 1px rgba(124, 128, 129, 0.2);
			padding-left: 0;
		}

			.dropotron > li > a {
				-moz-transition: none;
				-webkit-transition: none;
				-ms-transition: none;
				transition: none;
				color: inherit;
				text-decoration: none;
				padding: 0 1em;
				border: 0;
			}

			.dropotron > li:hover > a {
				background: #83d3c9;
				color: #fff;
			}

			.dropotron > li:first-child {
				border-top: 0;
			}
		</style>    


<header id="header" class="alt" style="
		
		color: inherit;
		cursor: default;
		font-size: 0.8em;
		left: 0;
		padding: 1em 1.5em;
		position: absolute;
		top: 0;
		width: 100%;
		z-index: 10000;">
			
			<h1 id="logo">
				<a href="../list/index.jsp" style="text-decoration: none; color: #3fb1a3" ><strong> <span>whereR</span>Hu
				</strong> </a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="current"><a href="#">Welcome</a></li>
					<li class="submenu"><a href="../list/index.jsp">menu</a>
						<ul>

							<li class="submenu"><a href="#">LookUP</a>
								<ul>
									<li><a href="#"> gas station</a></li>
									<li><a href="#">highway</a></li>
								</ul>
							<li><a href="left-sidebar.html">Search</a></li>
							<li><a href="right-sidebar.html">MyPage</a></li>
							<li><a href="contact.html">Contact</a></li>

						</ul></li>
					<li><a href="../user/loginChk" class="button primary">Login</a></li>
				</ul>
			</nav>
		</header>





    
	<div class="container">
		<div class="profile-header" style="background: rgba(233, 233, 233,0.7) ">
			<div class="profile-img">
				<img src="./img/login_icon1.png" width="200" alt="Profile Image">
			</div>
			<div class="profile-nav-info">
			<h3 class="user-name">MYPAGE</h3>
			</div>
			<div class="profile-option">
				<div class="notification">
					<i class="fa fa-bell"></i> <span class="alert-message">23</span>
				</div>
			</div>
		</div>
	</div>
	<div class="main-bd">
		<div class="left-side" style="background: rgba(233, 233, 233,0)">
			<div class="profile-side" style="background: rgba(233, 233, 233, 0.7)">
				<div>
				<p>${username}님 환영합니다</p>
				
				<br>
					<ul id="UserInfo">
						
						<li id="user_id"><label for="user_id">아이디</label> ${user_id}</li>
						<li id="username"><label for="user-name">이름</label> ${username}</li>
						<li id="user_email"><label for="mail">이메일</label> ${user_email}</li>
						<li id="user_phone"><label for="phone">연락처</label> ${user_phone}</li> 
						
					</ul>
					<br>
				</div>
				<div class="profile-btn">
					<button class="chatbtn" id="chatBtn" onclick = "location.href='../list/logout'">
						<i class="fa fa-comment"></i> 로그아웃
					</button>

				</div>
				
			</div>

		</div>
		
		
		
		
		
		<div class="right-side">

			<div class="nav" >
				<ul>
					<li onclick="tabs(0)" class="userInfo"  style="background: rgba(233, 233, 233,0.7); font-weight: bold ">회원정보수정</li>
					<li onclick="tabs(1)" class="review"  style="background: rgba(233, 233, 233,0.7); font-weight: bold">리뷰조회</li>
					<li onclick="tabs(2)" class="starview"  style="background: rgba(233, 233, 233,0.7); font-weight: bold">좋아요조회</li>
					<li onclick="tabs(3)" class="out"  style="background: rgba(233, 233, 233,0.7); font-weight: bold">회원탈퇴</li>
				</ul>
			</div>
			
			
			<div class="profile-body" id="here">

		</div>
		</div>
	</div>

</body>
</html>