import datetime as dt
from datetime import date, time, datetime as dt
from datetime import timezone
import pytz
from datetime import timedelta
from datetime import datetime, timedelta, time

def calc_age(birth_date):
  today = date.today()
  age = today.year - birth_date.year - ((today.month, today.day) < (birth_date.month, birth_date.day))
  return age

birth_date_str = input('please enter birthdate here (YYYY-MM-DD): ').split('-')
birth_date = date(int(birth_date_str[0]), int(birth_date_str[1]), int(birth_date_str[2]))
age = calc_age(birth_date)
print(age)
