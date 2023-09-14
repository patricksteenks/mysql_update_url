-- Define the old_url and new_url variables
SET @old_url = 'your_old_url';
SET @new_url = 'your_new_url';

-- Step 1: Find and Replace URLs in Posts and Pages
UPDATE wp_posts SET post_content = REPLACE(post_content, @old_url, @new_url);

-- Step 2: Find and Replace URLs in Post Meta (Custom Fields)
UPDATE wp_postmeta SET meta_value = REPLACE(meta_value, @old_url, @new_url);

-- Step 3: Find and Replace URLs in Options (if needed)
UPDATE wp_options SET option_value = REPLACE(option_value, @old_url, @new_url) WHERE option_name = 'home' OR option_name 
= 'siteurl';

-- Step 4: Find and Replace URLs in Comments (if needed)
UPDATE wp_comments SET comment_content = REPLACE(comment_content, @old_url, @new_url);

-- Step 5: Find and Replace URLs in Comment Meta (if needed)
UPDATE wp_commentmeta SET meta_value = REPLACE(meta_value, @old_url, @new_url);

-- Step 6: Find and Replace URLs in any other relevant tables (if needed)

-- Step 7: Flush Rewrite Rules (if needed)
UPDATE wp_options SET option_value = 'your_current_date_time' WHERE option_name = 'rewrite_rules';

-- Step 8: Verify and test your website to ensure everything is working as expected.

