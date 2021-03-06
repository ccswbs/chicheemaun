##default
# migrate.sh
#
# Run D7 -> D8 migration.
#

# Environment
SITE=${SITE:-ug-avalon}
ENV=${ENV:-dev}

# Wake up source site
terminus env:wake hjckrrh.dev </dev/null
sleep 10 # give site a chance to wake up

# Set target site to SFTP mode (required for install)
terminus connection:set $SITE.$ENV sftp </dev/null

# Re-install target site
terminus remote:drush $SITE.$ENV -- site-install -y ug --config-dir=sites/default/config </dev/null

# Run migration
terminus remote:drush $SITE.$ENV -- migrate-import --group=migrate_drupal_7 </dev/null

# Update migration (second pass)
terminus remote:drush $SITE.$ENV -- migrate-import --update --group=migrate_drupal_7 </dev/null

# Flip target site back to git mode
terminus connection:set $SITE.$ENV git </dev/null

