CREATE PROCEDURE [dbo].[getClientOptionSetting]
	@clientCode [char](15),
	@optionId [varchar](20)
WITH EXECUTE AS CALLER
AS
select 
   coalesce((select optionCode from optionsetting where clientCode=@clientCode and processOptionName='' and optionID=@optionId),
                  (select B.optionCode from OptionDefinition A join OptionCode B on A.optionId=B.optionId  where A.optionId=@optionId and A.[level] = 'C' and B.[default]='Y' ),
                  '###ERROR###') 
as optCode