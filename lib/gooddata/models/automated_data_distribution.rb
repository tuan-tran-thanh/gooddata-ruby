# encoding: UTF-8
#
# Copyright (c) 2010-2015 GoodData Corporation. All rights reserved.
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

module GoodData
  class AutomatedDataDistribution < Rest::Resource
    attr_accessor :output_stage

    def initialize(project)
      self.project = project
    end

    def process
      GoodData::Process[:all, project: project, client: project.client].find { |p| p.type == :dataload }
    end
  end
end
