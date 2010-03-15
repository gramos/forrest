Forrest the stories's runner
============================

Forrest is a runner for stories framework, you can run one story
inside of a file that have many stories, can run one scenario
or print the list of stories inside a file.

Print the stories/scenarios list
--------------------------------

    $ forrest test/forrest_stories_test.rb

    ==> Printing all stories/scenarios...


    + ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheBenchmarkForEachScenario%%--test/forrest_stories_test.rb
    |__ ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheBenchmarkForEachScenario#test_A_user_run_forrest_with_a_StoryName_as_a_param%%--test/forrest_stories_test.rb


    + ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat%%--test/forrest_stories_test.rb
    |__ ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat#test_A_user_run_forrest_with_a_StoryName_as_a_param%%--test/forrest_stories_test.rb

    |__ ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat#test_A_user_run_forrest_with_a_filepath_as_a_param%%--test/forrest_stories_test.rb

    Loaded suite

Run a particular story
----------------------

   $ forrest ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheBenchmarkForEachScenario%%--test/forrest_stories_test.rb

   ==> Runing story...

   Loaded suite ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat
   Started

   - As a stories user I want to see the stories report in a very nice format

       A user run forrest with a filepath as a param
       A user run forrest with a StoryName as a param

    Finished in 0.001404 seconds.

    2 tests, 0 assertions, 0 failures, 0 errors
    1 story,  2 scenarios

Run a particular scenario
-------------------------

    $ forrest ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat#test_A_user_run_forrest_with_a_StoryName_as_a_param%%--test/forrest_stories_test.rb

    ==> Runing scenario...

    test/forrest_stories_test
    Loaded suite test_A_user_run_forrest_with_a_filepath_as_a_param(ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat)
    Started
    .
    Finished in 0.000997 seconds.

    1 tests, 0 assertions, 0 failures, 0 errors


Yes, you are thinking this is a very large param, BUT, you can use this flow:

   1- Print all stories & scenarios in a file
   2- use de forrest command and copy and paste the story or scenario (from the step 1) as the param

In this was is very easy to use.

**and have fun!**