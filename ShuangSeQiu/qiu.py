# Author by san at 20211128

import os.path
import random
from abc import ABC

import tornado.httpserver
import tornado.ioloop
import tornado.options

import tornado.web

from tornado.options import define, options

define("port", default=10800, help="run on the given port", type=int)


class IndexHandler(tornado.web.RequestHandler, ABC):
    def get(self):
        self.render('index.html')


class CreateQiuHandler(tornado.web.RequestHandler, ABC):
    def CreateBalls(self, num=1):
        Balls = dict()
        balls_l = list()
        num = int(num)
        if num <= 1:
            Balls['红球'] = sorted(random.sample(range(1, 34), 6))
            Balls['蓝球'] = random.sample(range(1, 17), 1)
            balls_l.append(Balls)
            # return balls_l
        else:
            while len(balls_l) < num:
                Balls['红球'] = sorted(random.sample(range(1, 34), 6))
                Balls['蓝球'] = random.sample(range(1, 17), 1)
#                print(Balls, type(Balls))
                temp_l = ["红球:"] + Balls['红球'] + ["蓝球:"] + Balls['蓝球']
                balls_l.append(temp_l)
                print(type(balls_l))
        return balls_l

    def post(self):
        create_how_ball = self.get_argument('create')   # 依据前端网页中的 textare中的name 收集
        if not create_how_ball:
            create_how_ball = 1
        else:
            create_how_ball = int(create_how_ball)
        balls = self.CreateBalls(create_how_ball)
        self.render('qiu.html', How_balls=create_how_ball, balls=balls)  # choice可以传python函数到前端执行


if __name__ == '__main__':
    tornado.options.parse_command_line()
    app = tornado.web.Application(
        handlers=[(r'/', IndexHandler), (r'/create', CreateQiuHandler)],
        template_path=os.path.join(os.path.dirname(__file__), "templates"),
        static_path=os.path.join(os.path.dirname(__file__), "static"),
        debug=True
    )
    http_server = tornado.httpserver.HTTPServer(app)
    http_server.listen(options.port)
    tornado.ioloop.IOLoop.instance().start()
