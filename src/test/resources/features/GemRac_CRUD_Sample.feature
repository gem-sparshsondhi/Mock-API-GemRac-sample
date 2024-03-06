@Sample
Feature: Sample RestAssured Mocking service tests

  Background: Logging in
    Given User logs in with valid credentials

  @Create
  Scenario: Create a new User with pre-saved data
    Given user creates a new request named "Create New User" request and sets "createUser" as endpoint
    When user sets Content-Type as "application/json"
    When user adds "Create_John_Cena" body
    When user sends a "post" request
    Then user verifies "201" status code
    #The below is to delete the User which was just created
    Given user creates a new request named "Delete Specified User" request and sets "getSpecificUser" as endpoint
    When User retrieves ID for "John Cena" user and sets it as "id" path parameter to "Delete Specified User" request
    When user sends "Delete Specified User" request as a "delete" request
    Then user verifies "204" status code

  @Read
  Scenario: Retrieve User info
    Given user creates a new request named "Get Specific User" request and sets "getSpecificUser" as endpoint
    When user adds Path Parameter named "id" with value "1" to the request
    When user sends a "get" request
    Then user verifies "200" status code
    Then user verifies the presence of message "Bilbo Baggins" in response body

  @Update @Debug
  Scenario: Update User info using Put
    Given user creates a new request named "Create New User" request and sets "createUser" as endpoint
    When user sets Content-Type as "application/json"
    When user adds "Create_John_Cena" body
    When user sends a "post" request
    Then user verifies "201" status code
    #The above is to create the User which will then be updated
    Given user creates a new request named "Update New User" request and sets "getSpecificUser" as endpoint
    When user sets Content-Type as "application/json"
    When user adds "Put_John_Cena" body
    When User retrieves ID for "John Cena" user and sets it as "id" path parameter to "Update New User" request
    When user sends "Update New User" request as a "put" request
    Then user verifies "200" status code
    #The below is to delete the User which was just created
    Given user creates a new request named "Delete Specified User" request and sets "getSpecificUser" as endpoint
    When User retrieves ID for "John Cena" user and sets it as "id" path parameter to "Delete Specified User" request
    When user sends "Delete Specified User" request as a "delete" request
    Then user verifies "204" status code

  @Update
  Scenario: Update User info using Patch
    Given user creates a new request named "Create New User" request and sets "createUser" as endpoint
    When user sets Content-Type as "application/json"
    When user adds "Create_John_Cena" body
    When user sends a "post" request
    Then user verifies "201" status code
    #The above is to create the User which will then be updated
    Given user creates a new request named "Update New User" request and sets "getSpecificUser" as endpoint
    When user sets Content-Type as "application/json"
    When user adds "Patch_John_Cena" body
    When User retrieves ID for "John Cena" user and sets it as "id" path parameter to "Update New User" request
    When user sends "Update New User" request as a "patch" request
    Then user verifies "200" status code
    #The below is to delete the User which was just created
    Given user creates a new request named "Delete Specified User" request and sets "getSpecificUser" as endpoint
    When User retrieves ID for "John Cena" user and sets it as "id" path parameter to "Delete Specified User" request
    When user sends "Delete Specified User" request as a "delete" request
    Then user verifies "204" status code

  @Delete
  Scenario: User creates and Deletes a User profile
    Given user creates a new request named "Create New User" request and sets "createUser" as endpoint
    When user sets Content-Type as "application/json"
    When user adds "Create_John_Cena" body
    When user sends a "post" request
    Then user verifies "201" status code
    #The above is to create the User which will then be deleted
    Given user creates a new request named "Delete Specified User" request and sets "getSpecificUser" as endpoint
    When User retrieves ID for "John Cena" user and sets it as "id" path parameter to "Delete Specified User" request
    When user sends "Delete Specified User" request as a "delete" request
    Then user verifies "204" status code