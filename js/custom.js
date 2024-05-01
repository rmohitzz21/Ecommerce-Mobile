function send_message(){
	var name=jQuery("#name").val();
	var email=jQuery("#email").val();
	var mobile=jQuery("#mobile").val();
	var message=jQuery("#message").val();
	
	if(name==""){
		alert('Please enter name');
	}else if(email==""){
		alert('Please enter email');
	}else if(mobile==""){
		alert('Please enter mobile');
	}else if(message==""){
		alert('Please enter message');
	}else{
		jQuery.ajax({
			url:'send_message.php',
			type:'post',
			data:'name='+name+'&email='+email+'&mobile='+mobile+'&message='+message,
			success:function(result){
				alert(result);
			}	
		});
	}
}

function user_register(){
    jQuery('.field_error').html('');
    var name = jQuery("#name").val();
    var email = jQuery("#email").val();
    var mobile = jQuery("#mobile").val();
    var password = jQuery("#password").val();
    var is_error = '';

    // Simple regex for basic email validation
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    // Basic password strength criteria: at least 6 characters
    var minPasswordLength = 6;
	var mobileRegex = /^\d{10}$/; // Example: Validates a 10 digit number

    if(name == ""){
        jQuery('#name_error').html('Please enter name');
        is_error = 'yes';
    }
    if(email == ""){
        jQuery('#email_error').html('Please enter email');
        is_error = 'yes';
    } else if (!emailRegex.test(email)) { // Check if email matches the regex
        jQuery('#email_error').html('Please enter a valid email');
        is_error = 'yes';
    }
    if(mobile == ""){
        jQuery('#mobile_error').html('Please enter mobile');
        is_error = 'yes';
    } else if (!mobileRegex.test(mobile)) { // Validates the mobile number
        jQuery('#mobile_error').html('Please enter a valid mobile number');
        is_error = 'yes';
    }
    if(password == ""){
        jQuery('#password_error').html('Please enter password');
        is_error = 'yes';
    } else if (password.length < minPasswordLength) { // Check if password meets the length requirement
        jQuery('#password_error').html('Password must be at least ' + minPasswordLength + ' characters long');
        is_error = 'yes';
    }

    if(is_error == ''){
        jQuery.ajax({
            url: 'register_submit.php',
            type: 'post',
            data: 'name=' + name + '&email=' + email + '&mobile=' + mobile + '&password=' + password,
            success: function(result){
                if(result == 'email_present'){
                    jQuery('#email_error').html('Email id already present');
					alert('Email id already present.'); // Add this line for the alert
                }
                if(result == 'insert'){
                    jQuery('.register_msg p').html('Thank you for registration');
					alert('Thank you for your registration.'); // Add this line for the alert
                }
            }   
        });
    }
}


function user_login(){
	jQuery('.field_error').html('');
	var email=jQuery("#login_email").val();
	var password=jQuery("#login_password").val();
	var is_error='';
	if(email==""){
		jQuery('#login_email_error').html('Please enter email');
		is_error='yes';
	}if(password==""){
		jQuery('#login_password_error').html('Please enter password');
		is_error='yes';
	}
	if(is_error==''){
		jQuery.ajax({
			url:'login_submit.php',
			type:'post',
			data:'email='+email+'&password='+password,
			success:function(result){
				if(result=='wrong'){
					jQuery('.login_msg p').html('Please enter valid login details');
				}
				if(result=='valid'){
					window.location.href="index.php";
				}
			}	
		});
	}	
}


function manage_cart(pid,type,is_checkout){
	var qty = parseInt(jQuery("#" + pid + "qty").val(), 10); // Convert input to integer safely
    if (qty < 1) {
        alert("Quantity must be at least 1.");
        return; // Stop the function if the quantity is invalid
    }
	
	if(type=='update'){
		var qty=jQuery("#"+pid+"qty").val();
	}else{
		var qty=jQuery("#qty").val();
	}


	jQuery.ajax({
		url:'manage_cart.php',
		type:'post',
		data:'pid='+pid+'&qty='+qty+'&type='+type,
		success:function(result){
			result=result.trim();
			if(type=='update' || type=='remove'){
				window.location.href=window.location.href;
			}
			if(result=='not_avaliable'){
				alert('Qty not avaliable');	
			}else{
				jQuery('.htc__qua').html(result);
				if(is_checkout=='yes'){
					window.location.href='checkout.php';
				}
			}
		}	
	});	
}

function sort_product_drop(cat_id,site_path){
	var sort_product_id=jQuery('#sort_product_id').val();
	window.location.href=site_path+"categories.php?id="+cat_id+"&sort="+sort_product_id;
}

function wishlist_manage(pid,type){
	jQuery.ajax({
		url:'wishlist_manage.php',
		type:'post',
		data:'pid='+pid+'&type='+type,
		success:function(result){
			if(result=='not_login'){
				window.location.href='login.php';
			}else{
				jQuery('.htc__wishlist').html(result);
			}
		}	
	});	
}