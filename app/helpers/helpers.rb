def owns_question?(question)
  current_user == question.author
end