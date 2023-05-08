abstract class NewStates{}
class NewInitialStates extends NewStates{}
class NewNavBottomStates extends NewStates{}
class NewsLoadingBusinessStates extends NewStates{}
class NewsGetBusinessSuccessStates extends NewStates{}
class NewGetBusinessDataErrorStates extends NewStates
{
  final  String error ;
  NewGetBusinessDataErrorStates(this.error);
}
class NewsLoadingSportsStates extends NewStates{}
class NewsGetSportsSuccessStates extends NewStates{}
class NewGetSportsDataErrorStates extends NewStates
{
  final  String error ;
  NewGetSportsDataErrorStates(this.error);
}
class NewsLoadingScienceStates extends NewStates{}
class NewsGetScienceSuccessStates extends NewStates{}
class NewGetScienceDataErrorStates extends NewStates
{
  final  String error ;
  NewGetScienceDataErrorStates(this.error);
}
class NewsAppChangeModeState extends NewStates{}
class NewsLoadingSearchStates extends NewStates{}
class NewsGetSearchSuccessStates extends NewStates{}
class NewGetSearchDataErrorStates extends NewStates
{
  final  String error ;
  NewGetSearchDataErrorStates(this.error);
}
