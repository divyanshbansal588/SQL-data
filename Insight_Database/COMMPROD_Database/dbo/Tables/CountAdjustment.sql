CREATE TABLE [dbo].[CountAdjustment](
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[processingType] [varchar](4) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[changeInStatementCount] [int] NOT NULL,
	[changeInPageCount] [int] NOT NULL,
	[reason] [varchar](500) NOT NULL,
 CONSTRAINT [pkCountAdjustment] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[processingType] ASC,
	[tsCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CountAdjustment]  WITH NOCHECK ADD  CONSTRAINT [fkCountAdjustment#Processing] FOREIGN KEY([ticketNumber], [fileNumber], [processingType])
REFERENCES [dbo].[Processing] ([ticketNumber], [fileNumber], [processingType])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[CountAdjustment] CHECK CONSTRAINT [fkCountAdjustment#Processing]
GO
ALTER TABLE [dbo].[CountAdjustment] ADD  CONSTRAINT [DF__CountAdju__tsCre__5DA0D232]  DEFAULT (getdate()) FOR [tsCreated]