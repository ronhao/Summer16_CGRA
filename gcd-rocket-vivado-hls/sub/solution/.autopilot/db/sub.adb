<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE boost_serialization>
<boost_serialization signature="serialization::archive" version="11">
  <syndb class_id="0" tracking_level="0" version="0">
    <userIPLatency>-1</userIPLatency>
    <userIPName/>
    <cdfg class_id="1" tracking_level="1" version="0" object_id="_0">
      <name>sub</name>
      <ret_bitwidth>0</ret_bitwidth>
      <ports class_id="2" tracking_level="0" version="0">
        <count>2</count>
        <item_version>0</item_version>
        <item class_id="3" tracking_level="1" version="0" object_id="_1">
          <Value class_id="4" tracking_level="0" version="0">
            <Obj class_id="5" tracking_level="0" version="0">
              <type>1</type>
              <id>1</id>
              <name>io_cmd_V</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo class_id="6" tracking_level="0" version="0">
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName>io_cmd.V</originalName>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>160</bitwidth>
          </Value>
          <direction>0</direction>
          <if_type>0</if_type>
          <array_size>0</array_size>
          <bit_vecs class_id="7" tracking_level="0" version="0">
            <count>0</count>
            <item_version>0</item_version>
          </bit_vecs>
        </item>
        <item class_id_reference="3" object_id="_2">
          <Value>
            <Obj>
              <type>1</type>
              <id>2</id>
              <name>io_resp_V</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName>io_resp.V</originalName>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>74</bitwidth>
          </Value>
          <direction>1</direction>
          <if_type>0</if_type>
          <array_size>0</array_size>
          <bit_vecs>
            <count>0</count>
            <item_version>0</item_version>
          </bit_vecs>
        </item>
      </ports>
      <nodes class_id="8" tracking_level="0" version="0">
        <count>8</count>
        <item_version>0</item_version>
        <item class_id="9" tracking_level="1" version="0" object_id="_3">
          <Value>
            <Obj>
              <type>0</type>
              <id>9</id>
              <name>tmp</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName>tmp</originalName>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>160</bitwidth>
          </Value>
          <oprand_edges>
            <count>2</count>
            <item_version>0</item_version>
            <item>19</item>
            <item>20</item>
          </oprand_edges>
          <opcode>read</opcode>
        </item>
        <item class_id_reference="9" object_id="_4">
          <Value>
            <Obj>
              <type>0</type>
              <id>10</id>
              <name>tmp_rd_V</name>
              <fileName>sub.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>6</lineNumber>
              <contextFuncName>operator=</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item class_id="11" tracking_level="0" version="0">
                  <first>/work/zhang/common/tools/rocket/rocket-chip/gcd-rocket-vivado-hls</first>
                  <second class_id="12" tracking_level="0" version="0">
                    <count>2</count>
                    <item_version>0</item_version>
                    <item class_id="13" tracking_level="0" version="0">
                      <first class_id="14" tracking_level="0" version="0">
                        <first>sub.cpp</first>
                        <second>operator=</second>
                      </first>
                      <second>6</second>
                    </item>
                    <item>
                      <first>
                        <first>sub.cpp</first>
                        <second>sub</second>
                      </first>
                      <second>34</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName>tmp.rd.V</originalName>
              <rtlName>tmp_rd_V_fu_57_p4</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>5</bitwidth>
          </Value>
          <oprand_edges>
            <count>4</count>
            <item_version>0</item_version>
            <item>22</item>
            <item>23</item>
            <item>25</item>
            <item>27</item>
          </oprand_edges>
          <opcode>partselect</opcode>
        </item>
        <item class_id_reference="9" object_id="_5">
          <Value>
            <Obj>
              <type>0</type>
              <id>11</id>
              <name>a_V</name>
              <fileName>sub.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>6</lineNumber>
              <contextFuncName>operator=</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/work/zhang/common/tools/rocket/rocket-chip/gcd-rocket-vivado-hls</first>
                  <second>
                    <count>2</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>sub.cpp</first>
                        <second>operator=</second>
                      </first>
                      <second>6</second>
                    </item>
                    <item>
                      <first>
                        <first>sub.cpp</first>
                        <second>sub</second>
                      </first>
                      <second>34</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName>a.V</originalName>
              <rtlName>a_V_fu_67_p4</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>64</bitwidth>
          </Value>
          <oprand_edges>
            <count>4</count>
            <item_version>0</item_version>
            <item>29</item>
            <item>30</item>
            <item>32</item>
            <item>34</item>
          </oprand_edges>
          <opcode>partselect</opcode>
        </item>
        <item class_id_reference="9" object_id="_6">
          <Value>
            <Obj>
              <type>0</type>
              <id>12</id>
              <name>b_V</name>
              <fileName>sub.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>6</lineNumber>
              <contextFuncName>operator=</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/work/zhang/common/tools/rocket/rocket-chip/gcd-rocket-vivado-hls</first>
                  <second>
                    <count>2</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>sub.cpp</first>
                        <second>operator=</second>
                      </first>
                      <second>6</second>
                    </item>
                    <item>
                      <first>
                        <first>sub.cpp</first>
                        <second>sub</second>
                      </first>
                      <second>34</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName>b.V</originalName>
              <rtlName>b_V_fu_77_p4</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>64</bitwidth>
          </Value>
          <oprand_edges>
            <count>4</count>
            <item_version>0</item_version>
            <item>35</item>
            <item>36</item>
            <item>38</item>
            <item>40</item>
          </oprand_edges>
          <opcode>partselect</opcode>
        </item>
        <item class_id_reference="9" object_id="_7">
          <Value>
            <Obj>
              <type>0</type>
              <id>13</id>
              <name>a_V_2</name>
              <fileName>sub.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>40</lineNumber>
              <contextFuncName>sub</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/work/zhang/common/tools/rocket/rocket-chip/gcd-rocket-vivado-hls</first>
                  <second>
                    <count>1</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>sub.cpp</first>
                        <second>sub</second>
                      </first>
                      <second>40</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName>a.V</originalName>
              <rtlName>a_V_2_fu_87_p2</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>64</bitwidth>
          </Value>
          <oprand_edges>
            <count>2</count>
            <item_version>0</item_version>
            <item>41</item>
            <item>42</item>
          </oprand_edges>
          <opcode>sub</opcode>
        </item>
        <item class_id_reference="9" object_id="_8">
          <Value>
            <Obj>
              <type>0</type>
              <id>14</id>
              <name>tmp_1</name>
              <fileName>sub.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>49</lineNumber>
              <contextFuncName>sub</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/work/zhang/common/tools/rocket/rocket-chip/gcd-rocket-vivado-hls</first>
                  <second>
                    <count>1</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>sub.cpp</first>
                        <second>sub</second>
                      </first>
                      <second>49</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName>tmp.1</originalName>
              <rtlName>io_resp_V</rtlName>
              <coreName/>
            </Obj>
            <bitwidth>74</bitwidth>
          </Value>
          <oprand_edges>
            <count>4</count>
            <item_version>0</item_version>
            <item>44</item>
            <item>45</item>
            <item>46</item>
            <item>48</item>
          </oprand_edges>
          <opcode>bitconcatenate</opcode>
        </item>
        <item class_id_reference="9" object_id="_9">
          <Value>
            <Obj>
              <type>0</type>
              <id>15</id>
              <name/>
              <fileName>sub.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>49</lineNumber>
              <contextFuncName>sub</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/work/zhang/common/tools/rocket/rocket-chip/gcd-rocket-vivado-hls</first>
                  <second>
                    <count>1</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>sub.cpp</first>
                        <second>sub</second>
                      </first>
                      <second>49</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>0</bitwidth>
          </Value>
          <oprand_edges>
            <count>3</count>
            <item_version>0</item_version>
            <item>50</item>
            <item>51</item>
            <item>52</item>
          </oprand_edges>
          <opcode>write</opcode>
        </item>
        <item class_id_reference="9" object_id="_10">
          <Value>
            <Obj>
              <type>0</type>
              <id>16</id>
              <name/>
              <fileName>sub.cpp</fileName>
              <fileDirectory>..</fileDirectory>
              <lineNumber>50</lineNumber>
              <contextFuncName>sub</contextFuncName>
              <inlineStackInfo>
                <count>1</count>
                <item_version>0</item_version>
                <item>
                  <first>/work/zhang/common/tools/rocket/rocket-chip/gcd-rocket-vivado-hls</first>
                  <second>
                    <count>1</count>
                    <item_version>0</item_version>
                    <item>
                      <first>
                        <first>sub.cpp</first>
                        <second>sub</second>
                      </first>
                      <second>50</second>
                    </item>
                  </second>
                </item>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>0</bitwidth>
          </Value>
          <oprand_edges>
            <count>0</count>
            <item_version>0</item_version>
          </oprand_edges>
          <opcode>ret</opcode>
        </item>
      </nodes>
      <consts class_id="15" tracking_level="0" version="0">
        <count>7</count>
        <item_version>0</item_version>
        <item class_id="16" tracking_level="1" version="0" object_id="_11">
          <Value>
            <Obj>
              <type>2</type>
              <id>24</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>20</content>
        </item>
        <item class_id_reference="16" object_id="_12">
          <Value>
            <Obj>
              <type>2</type>
              <id>26</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>24</content>
        </item>
        <item class_id_reference="16" object_id="_13">
          <Value>
            <Obj>
              <type>2</type>
              <id>31</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>32</content>
        </item>
        <item class_id_reference="16" object_id="_14">
          <Value>
            <Obj>
              <type>2</type>
              <id>33</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>95</content>
        </item>
        <item class_id_reference="16" object_id="_15">
          <Value>
            <Obj>
              <type>2</type>
              <id>37</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>96</content>
        </item>
        <item class_id_reference="16" object_id="_16">
          <Value>
            <Obj>
              <type>2</type>
              <id>39</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>32</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>159</content>
        </item>
        <item class_id_reference="16" object_id="_17">
          <Value>
            <Obj>
              <type>2</type>
              <id>47</id>
              <name>empty</name>
              <fileName/>
              <fileDirectory/>
              <lineNumber>0</lineNumber>
              <contextFuncName/>
              <inlineStackInfo>
                <count>0</count>
                <item_version>0</item_version>
              </inlineStackInfo>
              <originalName/>
              <rtlName/>
              <coreName/>
            </Obj>
            <bitwidth>5</bitwidth>
          </Value>
          <const_type>0</const_type>
          <content>0</content>
        </item>
      </consts>
      <blocks class_id="17" tracking_level="0" version="0">
        <count>1</count>
        <item_version>0</item_version>
        <item class_id="18" tracking_level="1" version="0" object_id="_18">
          <Obj>
            <type>3</type>
            <id>17</id>
            <name>sub</name>
            <fileName/>
            <fileDirectory/>
            <lineNumber>0</lineNumber>
            <contextFuncName/>
            <inlineStackInfo>
              <count>0</count>
              <item_version>0</item_version>
            </inlineStackInfo>
            <originalName/>
            <rtlName/>
            <coreName/>
          </Obj>
          <node_objs>
            <count>8</count>
            <item_version>0</item_version>
            <item>9</item>
            <item>10</item>
            <item>11</item>
            <item>12</item>
            <item>13</item>
            <item>14</item>
            <item>15</item>
            <item>16</item>
          </node_objs>
        </item>
      </blocks>
      <edges class_id="19" tracking_level="0" version="0">
        <count>17</count>
        <item_version>0</item_version>
        <item class_id="20" tracking_level="1" version="0" object_id="_19">
          <id>20</id>
          <edge_type>1</edge_type>
          <source_obj>1</source_obj>
          <sink_obj>9</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_20">
          <id>23</id>
          <edge_type>1</edge_type>
          <source_obj>9</source_obj>
          <sink_obj>10</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_21">
          <id>25</id>
          <edge_type>1</edge_type>
          <source_obj>24</source_obj>
          <sink_obj>10</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_22">
          <id>27</id>
          <edge_type>1</edge_type>
          <source_obj>26</source_obj>
          <sink_obj>10</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_23">
          <id>30</id>
          <edge_type>1</edge_type>
          <source_obj>9</source_obj>
          <sink_obj>11</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_24">
          <id>32</id>
          <edge_type>1</edge_type>
          <source_obj>31</source_obj>
          <sink_obj>11</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_25">
          <id>34</id>
          <edge_type>1</edge_type>
          <source_obj>33</source_obj>
          <sink_obj>11</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_26">
          <id>36</id>
          <edge_type>1</edge_type>
          <source_obj>9</source_obj>
          <sink_obj>12</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_27">
          <id>38</id>
          <edge_type>1</edge_type>
          <source_obj>37</source_obj>
          <sink_obj>12</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_28">
          <id>40</id>
          <edge_type>1</edge_type>
          <source_obj>39</source_obj>
          <sink_obj>12</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_29">
          <id>41</id>
          <edge_type>1</edge_type>
          <source_obj>11</source_obj>
          <sink_obj>13</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_30">
          <id>42</id>
          <edge_type>1</edge_type>
          <source_obj>12</source_obj>
          <sink_obj>13</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_31">
          <id>45</id>
          <edge_type>1</edge_type>
          <source_obj>13</source_obj>
          <sink_obj>14</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_32">
          <id>46</id>
          <edge_type>1</edge_type>
          <source_obj>10</source_obj>
          <sink_obj>14</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_33">
          <id>48</id>
          <edge_type>1</edge_type>
          <source_obj>47</source_obj>
          <sink_obj>14</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_34">
          <id>51</id>
          <edge_type>1</edge_type>
          <source_obj>2</source_obj>
          <sink_obj>15</sink_obj>
        </item>
        <item class_id_reference="20" object_id="_35">
          <id>52</id>
          <edge_type>1</edge_type>
          <source_obj>14</source_obj>
          <sink_obj>15</sink_obj>
        </item>
      </edges>
    </cdfg>
    <cdfg_regions class_id="21" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="22" tracking_level="1" version="0" object_id="_36">
        <mId>1</mId>
        <mTag>sub</mTag>
        <mType>0</mType>
        <sub_regions>
          <count>0</count>
          <item_version>0</item_version>
        </sub_regions>
        <basic_blocks>
          <count>1</count>
          <item_version>0</item_version>
          <item>17</item>
        </basic_blocks>
        <mII>-1</mII>
        <mDepth>-1</mDepth>
        <mMinTripCount>-1</mMinTripCount>
        <mMaxTripCount>-1</mMaxTripCount>
        <mMinLatency>0</mMinLatency>
        <mMaxLatency>-1</mMaxLatency>
        <mIsDfPipe>0</mIsDfPipe>
        <mDfPipe class_id="-1"/>
      </item>
    </cdfg_regions>
    <fsm class_id="24" tracking_level="1" version="0" object_id="_37">
      <states class_id="25" tracking_level="0" version="0">
        <count>1</count>
        <item_version>0</item_version>
        <item class_id="26" tracking_level="1" version="0" object_id="_38">
          <id>1</id>
          <operations class_id="27" tracking_level="0" version="0">
            <count>14</count>
            <item_version>0</item_version>
            <item class_id="28" tracking_level="1" version="0" object_id="_39">
              <id>3</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_40">
              <id>4</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_41">
              <id>5</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_42">
              <id>6</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_43">
              <id>7</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_44">
              <id>8</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_45">
              <id>9</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_46">
              <id>10</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_47">
              <id>11</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_48">
              <id>12</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_49">
              <id>13</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_50">
              <id>14</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_51">
              <id>15</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
            <item class_id_reference="28" object_id="_52">
              <id>16</id>
              <stage>1</stage>
              <latency>1</latency>
            </item>
          </operations>
        </item>
      </states>
      <transitions class_id="29" tracking_level="0" version="0">
        <count>0</count>
        <item_version>0</item_version>
      </transitions>
    </fsm>
    <res class_id="30" tracking_level="1" version="0" object_id="_53">
      <dp_component_resource class_id="31" tracking_level="0" version="0">
        <count>0</count>
        <item_version>0</item_version>
      </dp_component_resource>
      <dp_expression_resource>
        <count>2</count>
        <item_version>0</item_version>
        <item class_id="32" tracking_level="0" version="0">
          <first>a_V_2_fu_87_p2 ( - ) </first>
          <second class_id="33" tracking_level="0" version="0">
            <count>4</count>
            <item_version>0</item_version>
            <item class_id="34" tracking_level="0" version="0">
              <first>(0P0)</first>
              <second>64</second>
            </item>
            <item>
              <first>(1P1)</first>
              <second>64</second>
            </item>
            <item>
              <first>FF</first>
              <second>0</second>
            </item>
            <item>
              <first>LUT</first>
              <second>64</second>
            </item>
          </second>
        </item>
        <item>
          <first>ap_sig_bdd_77 ( and ) </first>
          <second>
            <count>4</count>
            <item_version>0</item_version>
            <item>
              <first>(0P0)</first>
              <second>1</second>
            </item>
            <item>
              <first>(1P1)</first>
              <second>1</second>
            </item>
            <item>
              <first>FF</first>
              <second>0</second>
            </item>
            <item>
              <first>LUT</first>
              <second>1</second>
            </item>
          </second>
        </item>
      </dp_expression_resource>
      <dp_fifo_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_fifo_resource>
      <dp_memory_resource>
        <count>0</count>
        <item_version>0</item_version>
      </dp_memory_resource>
      <dp_multiplexer_resource>
        <count>1</count>
        <item_version>0</item_version>
        <item>
          <first>ap_sig_ioackin_io_resp_V_ap_ack</first>
          <second>
            <count>4</count>
            <item_version>0</item_version>
            <item>
              <first>(0Size)</first>
              <second>2</second>
            </item>
            <item>
              <first>(1Bits)</first>
              <second>1</second>
            </item>
            <item>
              <first>(2Count)</first>
              <second>2</second>
            </item>
            <item>
              <first>LUT</first>
              <second>1</second>
            </item>
          </second>
        </item>
      </dp_multiplexer_resource>
      <dp_register_resource>
        <count>2</count>
        <item_version>0</item_version>
        <item>
          <first>ap_CS_fsm</first>
          <second>
            <count>3</count>
            <item_version>0</item_version>
            <item>
              <first>(Bits)</first>
              <second>1</second>
            </item>
            <item>
              <first>(Consts)</first>
              <second>0</second>
            </item>
            <item>
              <first>FF</first>
              <second>1</second>
            </item>
          </second>
        </item>
        <item>
          <first>ap_reg_ioackin_io_resp_V_ap_ack</first>
          <second>
            <count>3</count>
            <item_version>0</item_version>
            <item>
              <first>(Bits)</first>
              <second>1</second>
            </item>
            <item>
              <first>(Consts)</first>
              <second>0</second>
            </item>
            <item>
              <first>FF</first>
              <second>1</second>
            </item>
          </second>
        </item>
      </dp_register_resource>
      <dp_component_map class_id="35" tracking_level="0" version="0">
        <count>0</count>
        <item_version>0</item_version>
      </dp_component_map>
      <dp_expression_map>
        <count>1</count>
        <item_version>0</item_version>
        <item class_id="36" tracking_level="0" version="0">
          <first>a_V_2_fu_87_p2 ( - ) </first>
          <second>
            <count>1</count>
            <item_version>0</item_version>
            <item>13</item>
          </second>
        </item>
      </dp_expression_map>
      <dp_fifo_map>
        <count>0</count>
        <item_version>0</item_version>
      </dp_fifo_map>
      <dp_memory_map>
        <count>0</count>
        <item_version>0</item_version>
      </dp_memory_map>
    </res>
    <node_label_latency class_id="37" tracking_level="0" version="0">
      <count>8</count>
      <item_version>0</item_version>
      <item class_id="38" tracking_level="0" version="0">
        <first>9</first>
        <second class_id="39" tracking_level="0" version="0">
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>10</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>11</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>12</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>13</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>14</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>15</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
      <item>
        <first>16</first>
        <second>
          <first>0</first>
          <second>0</second>
        </second>
      </item>
    </node_label_latency>
    <bblk_ent_exit class_id="40" tracking_level="0" version="0">
      <count>1</count>
      <item_version>0</item_version>
      <item class_id="41" tracking_level="0" version="0">
        <first>17</first>
        <second class_id="42" tracking_level="0" version="0">
          <first>0</first>
          <second>0</second>
        </second>
      </item>
    </bblk_ent_exit>
    <regions class_id="43" tracking_level="0" version="0">
      <count>0</count>
      <item_version>0</item_version>
    </regions>
    <dp_fu_nodes class_id="44" tracking_level="0" version="0">
      <count>7</count>
      <item_version>0</item_version>
      <item class_id="45" tracking_level="0" version="0">
        <first>44</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>9</item>
        </second>
      </item>
      <item>
        <first>50</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>15</item>
        </second>
      </item>
      <item>
        <first>57</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>10</item>
        </second>
      </item>
      <item>
        <first>67</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>11</item>
        </second>
      </item>
      <item>
        <first>77</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>12</item>
        </second>
      </item>
      <item>
        <first>87</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>13</item>
        </second>
      </item>
      <item>
        <first>93</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>14</item>
        </second>
      </item>
    </dp_fu_nodes>
    <dp_fu_nodes_expression class_id="47" tracking_level="0" version="0">
      <count>5</count>
      <item_version>0</item_version>
      <item class_id="48" tracking_level="0" version="0">
        <first>a_V_2_fu_87</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>13</item>
        </second>
      </item>
      <item>
        <first>a_V_fu_67</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>11</item>
        </second>
      </item>
      <item>
        <first>b_V_fu_77</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>12</item>
        </second>
      </item>
      <item>
        <first>tmp_1_fu_93</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>14</item>
        </second>
      </item>
      <item>
        <first>tmp_rd_V_fu_57</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>10</item>
        </second>
      </item>
    </dp_fu_nodes_expression>
    <dp_fu_nodes_module>
      <count>0</count>
      <item_version>0</item_version>
    </dp_fu_nodes_module>
    <dp_fu_nodes_io>
      <count>2</count>
      <item_version>0</item_version>
      <item>
        <first>stg_14_write_fu_50</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>15</item>
        </second>
      </item>
      <item>
        <first>tmp_read_fu_44</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>9</item>
        </second>
      </item>
    </dp_fu_nodes_io>
    <return_ports>
      <count>0</count>
      <item_version>0</item_version>
    </return_ports>
    <dp_mem_port_nodes class_id="49" tracking_level="0" version="0">
      <count>0</count>
      <item_version>0</item_version>
    </dp_mem_port_nodes>
    <dp_reg_nodes>
      <count>0</count>
      <item_version>0</item_version>
    </dp_reg_nodes>
    <dp_regname_nodes>
      <count>0</count>
      <item_version>0</item_version>
    </dp_regname_nodes>
    <dp_reg_phi>
      <count>0</count>
      <item_version>0</item_version>
    </dp_reg_phi>
    <dp_regname_phi>
      <count>0</count>
      <item_version>0</item_version>
    </dp_regname_phi>
    <dp_port_io_nodes class_id="50" tracking_level="0" version="0">
      <count>2</count>
      <item_version>0</item_version>
      <item class_id="51" tracking_level="0" version="0">
        <first>io_cmd_V</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>
            <first>read</first>
            <second>
              <count>1</count>
              <item_version>0</item_version>
              <item>9</item>
            </second>
          </item>
        </second>
      </item>
      <item>
        <first>io_resp_V</first>
        <second>
          <count>1</count>
          <item_version>0</item_version>
          <item>
            <first>write</first>
            <second>
              <count>1</count>
              <item_version>0</item_version>
              <item>15</item>
            </second>
          </item>
        </second>
      </item>
    </dp_port_io_nodes>
    <port2core class_id="52" tracking_level="0" version="0">
      <count>0</count>
      <item_version>0</item_version>
    </port2core>
    <node2core>
      <count>0</count>
      <item_version>0</item_version>
    </node2core>
  </syndb>
</boost_serialization>
