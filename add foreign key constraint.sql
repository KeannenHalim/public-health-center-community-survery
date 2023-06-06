--Users
ALTER TABLE Users
ADD CONSTRAINT FK_Users_Role
FOREIGN KEY (fkRole) REFERENCES [Role](idRole)

--Questions
ALTER TABLE Questions
ADD CONSTRAINT FK_Questions_Form
FOREIGN KEY (fkForm) REFERENCES Form(idForm)

--AnswerGroup
ALTER TABLE AnswerGroup
ADD CONSTRAINT FK_AnswerGroup_Form
FOREIGN KEY (fkForm) REFERENCES Form(idForm)

--AnswerItemText
ALTER TABLE AnswerItemText
ADD CONSTRAINT FK_AnswerItemText_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE AnswerItemText
ADD CONSTRAINT FK_AnswerItemText_AnswerGroup
FOREIGN KEY (fkAnswerGroup) REFERENCES AnswerGroup(idAnswer)

ALTER TABLE AnswerItemText
ADD CONSTRAINT FK_AnswerItemText_Question
FOREIGN KEY (fkQuestion) REFERENCES Questions(idQuestion)

--AnswerItemNumeric
ALTER TABLE AnswerItemNumeric
ADD CONSTRAINT FK_AnswerItemNumeric_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE AnswerItemNumeric
ADD CONSTRAINT FK_AnswerItemNumeric_AnswerGroup
FOREIGN KEY (fkAnswerGroup) REFERENCES AnswerGroup(idAnswer)

ALTER TABLE AnswerItemNumeric
ADD CONSTRAINT FK_AnswerItemNumeric_Question
FOREIGN KEY (fkQuestion) REFERENCES Questions(idQuestion)

--AnswerItemDate
ALTER TABLE AnswerItemDate
ADD CONSTRAINT FK_AnswerItemDate_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE AnswerItemDate
ADD CONSTRAINT FK_AnswerItemDate_AnswerGroup
FOREIGN KEY (fkAnswerGroup) REFERENCES AnswerGroup(idAnswer)

ALTER TABLE AnswerItemDate
ADD CONSTRAINT FK_AnswerItemDate_Question
FOREIGN KEY (fkQuestion) REFERENCES Questions(idQuestion)

--LogChangeQuestions
ALTER TABLE LogChangeQuestions
ADD CONSTRAINT FK_LogChangeQuestions_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE LogChangeQuestions
ADD CONSTRAINT FK_LogChangeQuestions__Question
FOREIGN KEY (fkQuestions) REFERENCES Questions(idQuestion)

--LogChangeForm
ALTER TABLE LogChangeForm
ADD CONSTRAINT FK_LogChangeForm_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE LogChangeForm
ADD CONSTRAINT FK_LogChangeForm_Form
FOREIGN KEY (fkForm) REFERENCES Form(idForm)