CREATE TABLE [dbo].[scsFilterCriteria](
	[filterCriteriaId] [uniqueidentifier] NOT NULL,
	[filterId] [uniqueidentifier] NOT NULL,
	[fieldId] [uniqueidentifier] NOT NULL,
	[operator] [varchar](20) NOT NULL,
	[value1] [varchar](100) NOT NULL,
	[value2] [varchar](100) NOT NULL,
	[valueList] [varchar](5000) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsFilterCriteria] PRIMARY KEY CLUSTERED 
(
	[filterCriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsFilterCriteria]  WITH NOCHECK ADD  CONSTRAINT [FKscsFilterCriteria#scsField] FOREIGN KEY([fieldId])
REFERENCES [dbo].[scsField] ([fieldId])
GO

ALTER TABLE [dbo].[scsFilterCriteria] CHECK CONSTRAINT [FKscsFilterCriteria#scsField]
GO
ALTER TABLE [dbo].[scsFilterCriteria]  WITH NOCHECK ADD  CONSTRAINT [FKscsFilterCriteria#scsFilter] FOREIGN KEY([filterId])
REFERENCES [dbo].[scsFilter] ([filterId])
GO

ALTER TABLE [dbo].[scsFilterCriteria] CHECK CONSTRAINT [FKscsFilterCriteria#scsFilter]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [DF_scsFilterCriteria_filterCriteriaId]  DEFAULT (newid()) FOR [filterCriteriaId]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [DF__scsFilter__value__4F12BBB9]  DEFAULT ('') FOR [value1]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [DF__scsFilter__value__5006DFF2]  DEFAULT ('') FOR [value2]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [DF__scsFilter__value__50FB042B]  DEFAULT ('') FOR [valueList]
GO
ALTER TABLE [dbo].[scsFilterCriteria] ADD  CONSTRAINT [MSrepl_tran_version_default_29193225_A875_40D3_BCF3_3401A315A755_951674438]  DEFAULT (newid()) FOR [msrepl_tran_version]