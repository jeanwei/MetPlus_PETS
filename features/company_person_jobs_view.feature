Feature: Company Person Jobs View

  As a company person
  I want to view all available job listings in my company

  Background:
    Given the following agency roles exist:
      | role  |
      | AA    |
      | CM    |
      | JD    |

    Given the following agencies exist:
      | name    | website     | phone        | email                  | fax          |
      | MetPlus | metplus.org | 555-111-2222 | pets_admin@metplus.org | 617-555-1212 |

    Given the following agency people exist:
      | agency  | role  | first_name | last_name | email            | password  |
      | MetPlus | AA    | John       | Smith     | aa@metplus.org   | qwerty123 |
      | MetPlus | CM    | Jane       | Jones     | jane@metplus.org | qwerty123 |

    Given the following company roles exist:
      | role  |
      | CA    |
      | CC    |

    Given the following companies exist:
      | agency  | name         | website     | phone        | email            | job_email        | ein        | status |
      | MetPlus | Widgets Inc. | widgets.com | 555-222-3333 | corp@ymail.com | corp@ymail.com | 12-3456789 | active |
      | MetPlus | Feature Inc. | feature.com | 555-222-3333 | corp@feature.com | corp@feature.com | 12-3456788 | active |

    Given the following company addresses exist:
      | company       | street           | city    | zipcode | state      |
      | Widgets Inc.  | 12 Main Street   | Detroit | 02034   | Michigan   |
      | Widgets Inc.  | 14 Main Street   | Detroit | 02034   | Michigan   |
      | Feature Inc.  | 100 River Valley | Utah    | 12334   | New Jersey |
      | Feature Inc.  | 111 River Valley | Utah    | 12334   | New Jersey |

    Given the following company people exist:
      | company      | role  | first_name | last_name | email            | password  | phone        |
      | Widgets Inc. | CA    | John       | Smith     | carter@ymail.com.com   | qwerty123 | 555-222-3334 |
      | Widgets Inc. | CC    | Jane       | Smith     | jane@ymail.com | qwerty123 | 555-222-3334 |
      | Feature Inc. | CA    | Charles    | Daniel    | ca@feature.com   | qwerty123 | 555-222-3334 |

    Given the following jobs exist:
      | title               | company_job_id  | shift  | fulltime | description                 | company      | creator        |
      | software developer  | KRK01K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | software developer  | KRK02K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | software developer  | KRK03K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | software developer  | KRK04K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | software developer  | KRK05K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | software developer  | KRK06K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | software developer  | KRK07K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | software developer  | KRK08K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | software developer  | KRK09K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | software developer  | KRK10K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Cook                | KRK11K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Doctor              | AAEE1K          | Evening| true     | internship position with pay| Feature Inc. | ca@feature.com |
      | Cook                | KRK12K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Cook                | KRK13K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Cook                | KRK14K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Cook                | KRK15K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Cook                | KRK16K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Cook                | KRK17K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Cook                | KRK18K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Cook                | KRK19K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |
      | Cook                | KRK20K          | Evening| true     | internship position with pay| Widgets Inc. | carter@ymail.com.com |

  @javascript
  Scenario: verify job listing in home page
    Given I am on the home page
    And I login as "carter@ymail.com.com" with password "qwerty123"
    And I should be on the Company Person 'carter@ymail.com.com' Home page
    And I wait for 5 seconds
    And I should see "Cook"
    And I should not see "Doctor"
    And I should not see "software developer"
