Print the stories/scenarios list
================================

   forrest test/forrest_stories_test.rb

   + ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheBenchmarkForEachScenario
   |__ ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheBenchmarkForEachScenario#test_A_user_run_forrest_with_a_StoryName_as_a_param

   + ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat
   |__ ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat#test_A_user_run_forrest_with_a_StoryName_as_a_param
   |__ ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat#test_A_user_run_forrest_with_a_filepath_as_a_param
   Loaded suite

Run a particular story
======================

  ==> Runing story...

  Loaded suite ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat
  Started

  - As a stories user I want to see the stories report in a very nice format

      A user run forrest with a filepath as a param
      A user run forrest with a StoryName as a param

   Finished in 0.001404 seconds.

   2 tests, 0 assertions, 0 failures, 0 errors
   1 story,  2 scenarios

Run a particualr scenario
=========================

   forrest ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat#test_A_user_run_forrest_with_a_filepath_as_a_param

   ==> Runing scenario...

   test/forrest_stories_test
   Loaded suite test_A_user_run_forrest_with_a_filepath_as_a_param(ForrestStoriesTest::TestAsAStoriesUserIWantToSeeTheStoriesReportInAVeryNiceFormat)
   Started
   .
   Finished in 0.000997 seconds.

   1 tests, 0 assertions, 0 failures, 0 errors

and have fun!