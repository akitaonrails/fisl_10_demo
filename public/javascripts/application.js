jQuery(document).ajaxSend(function(event, request, settings) {
	if (typeof(window._auth_token) == "undefined") return;
	// settings.data is a serialized string like "foo=bar&baz=boink" (or null)
	settings.data = settings.data || "";
	settings.data += (settings.data ? "&" : "") + 
		encodeURIComponent(window._auth_token_name) + "=" + encodeURIComponent(window._auth_token);
});

jQuery(function($) { // document ready
    // Uses the new live method in jQuery 1.3+
    $('a.delete').live('click', function(event) {
		var link = this;
        if ( confirm("Are you sure you want to delete this Post?") )
            $.ajax({
                url: this.href.replace('/confirm_destroy', ''),
                type: 'post',
                data: { '_method': 'delete' },
                success: function(data, status) {
                    $(link).parent().parent().slideUp();
                }
            });

        return false;
    });
});
