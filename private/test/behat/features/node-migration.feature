Feature: Node migration
	In order to verify migrations ran at all
	As a maintainer
	I need to see that a node has moved from Drupal

	Scenario: Page 2
		Given I am on "page-2"
		Then print current URL
		Then I should see "Page 2"
		Then I should see "hâc portitorsé"
		Then I should see "test"
