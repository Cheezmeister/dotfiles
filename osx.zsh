
function macRemindersTodo() {
  osascript -e 'tell application "Reminders" to get name of every reminder of list named "To Do" whose completed is false'
}
