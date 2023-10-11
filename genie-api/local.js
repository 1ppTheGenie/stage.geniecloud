await api({
	rawPath: "/update-renders",
	body: JSON.stringify({
		assetId: "would-you-be-seller-mail",
	}),
});

console.log(
	await api({
		Records: [
			{
				eventSource: "aws:s3",
				s3: {
					object: {
						key: "_processing/50eedd7b-5df4-4ff0-aee9-5dbce0378201/lc-vip-fb-prop-ad-1-png-p0-prep.json",
					},
				},
			},
		],
	})
);

/*
console.log(
	await api({
		rawPath: "/create",
		body: JSON.stringify({
			asset: "just-listed-kit",
			userId: "4865455f-29a0-4c8f-9938-8c4bab261ef6",
			theme: "ed-kaminsky-light",
			mlsNumber: "230012718",
			mlsId: 0,
			areaId: 6766,
		}),
	})
);

await api({
	Records: [
		{
			messageId: "c4006aea-484e-4478-a068-3f942e26cc38",
			receiptHandle:
				"AQEBFnwpfQpVI39SRbTOOGl9O37zI6b5y6HaIOFgray37FU/jVbIV1HeF1rsRwvgXPn28qTvyoln7YeO8tV+bGPUsOyQB+wX6EzM1/RNhvmY9ViPB8B/jsd2hEFUWEcTlQ8HqGSDhrOHn0iHDZ54+T0CWOXsPYtrmGHjoWkCUQ2tp4sVSXUTKQinY6IMyhVobBFBmS1XRvjV4ejhhVZPWau1dPOlg8vDWUR6FlK+OvvfLDitgDa2a8YpD9vIn2DnoRstR2EtC/wZe8+dsLvbzAp2pZtL7CfvVTHZZtJo+RTEKMsdM1cgI1cKRiE+y1zZ6XpJlpoqyiWjfsc20ZKa9TH5uapfHPpChXrkFZGq9zuRzfB2wetH/u8vCbKxRWHvcJztbTT7AA+NISgzagyQ3CZN9A==",
			body: "prepare",
			attributes: {
				ApproximateReceiveCount: "1",
				AWSTraceHeader:
					"Root=1-649c748b-570e3184513e8acf5d5313c6;Parent=03e686620f43884c;Sampled=0;Lineage=2941b67d:0",
				SentTimestamp: "1687975051323",
				SenderId: "AROAYQIMNN46TCMGPPXXJ:GenieAPI",
				ApproximateFirstReceiveTimestamp: "1687975051326",
			},
			messageAttributes: {
				collectionId: {
					stringValue: "bfeae884-3980-4915-ac36-2795f771b2b4",
					stringListValues: [],
					binaryListValues: [],
					dataType: "String",
				},
			},
			md5OfMessageAttributes: "3d9ffc24b4ac72135880f6456c44ab3b",
			md5OfBody: "5075140835d0bc504791c76b04c33d2b",
			eventSource: "aws:sqs",
			eventSourceARN: "arn:aws:sqs:eu-west-2:584678469437:genie-cloud",
			awsRegion: "eu-west-2",
		},
	],
});
*/
