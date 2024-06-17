alias composer="php /root/composer.phar"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Function to create posts
create_posts() {
 # Set the default number of posts to 10 if no argument is provided
 local num_posts=${1:-5}

 # Loop to create the specified number of posts
 for ((index=1; index<=num_posts; index++)); do
   echo $index
    # Use WP-CLI to create a post with the title "foobar$index" and content "lorem ipsum"
    wp post create --post_type=post --post_status=publish --post_title="foobar_$index" --post_content="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse hendrerit mauris ut rutrum accumsan. Vivamus mollis ipsum eget ipsum auctor, eu efficitur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse hendrerit mauris ut rutrum accumsan. Vivamus mollis ipsum eget ipsum auctor, eu efficitur"
 done
 wp post create --post_type=post --post_status=publish --post_title="Login with admin:admin" --post_content="http://localhost:1337/wp-admin"
}

readd_admin(){
  wp user create admin ctbb_wf_docker@exploit.ee --role=administrator --user_pass=admin
}

dbinit(){
  wp --allow-root core install --admin_email=ctbb_wf_docker@exploit.ee --url=localhost:1337 --title="Just a Boring Blog" --admin_user=admin --admin_password=admin
  # readd_admin
  wp user create subscriber ctbb_wf_docker_subscriber@exploit.ee --role=subscriber --user_pass=subscriber
  wp user create contributor ctbb_wf_docker_contributor@exploit.ee --role=contributor --user_pass=contributor
  wp user create editor ctbb_wf_docker_editor@exploit.ee --role=editor --user_pass=editor
  wp user list
  wp theme install twentytwentyfour # if you deleted it like me
  wp theme activate twentytwentyfour # if you deleted it like me
}
