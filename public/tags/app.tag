<app>
	<div class="row">
		<h4>Have you heard of the eggboy meme?</h4>
		<div class="col-md-4">

			<!-- 16:9 aspect ratio -->
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" width="560" height="315" src="https://www.youtube.com/embed/AUMXEI6-YXU?rel=0" frameborder="0" allowfullscreen="allowfullscreen"></iframe>
			</div>
		</div>
	</div>

	<div class="row">
		<h4>What people have been saying:</h4>
		<public if={ !user }></public>
	</div>

	<div class="row">
		<h4>Login to say something</h4>
		<button if={ !user } class="btn btn-success" onclick={ logIn }>LOGIN</button>
		<button if={ user } class="btn btn-danger" onclick={ logOut }>LOGOUT</button>
		<input if={ user }></input>
		<private if={ user }></private>
	</div>


	<script>
		var that = this;

		// firebase.auth().currentUser will always reflect the current authenticated user state. Gives a user object if logged in. Gives null if logged out.
		this.user = firebase.auth().currentUser;

		// AUTHENTICATION LISTENER Once we code this, we have a "live" listener that is constantly listening for whether the user is logged in or not. It will fire the callback if it "hears" a login, or logout.
		firebase.auth().onAuthStateChanged(function (userObj) {
			that.user = firebase.auth().currentUser;
			that.update();
		});

		logIn(event) {
			// Specify that you want to sign up with Google authentication
			var provider = new firebase.auth.GoogleAuthProvider();

			// Popover signup is probably the most simple and trusted.
			firebase.auth().signInWithPopup(provider);
		}

		logOut(event) {
			firebase.auth().signOut();
		}
	</script>

	<style>
		:scope {
			display: block;
		}

		.row:nth-child(1){
			padding: 2em;
			background-color: red;
		}

		.row:nth-child(2){
			padding: 2em;
			background-color: yellow;
		}

		.row:nth-child(3){
			padding: 2em;
			background-color: powderblue;
		}

	</style>
</app>
