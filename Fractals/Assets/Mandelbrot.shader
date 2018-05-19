Shader "Fractals/Mandelbrot"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Area("Area", vector) = (0,0, 4, 4)
		_LoopCount("LoopCount", float) = 255
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;
			float4 _Area;
			float _LoopCount;
			fixed4 frag (v2f i) : SV_Target
			{
				float2 c = _Area.xy + ((i.uv - 0.5f) * _Area.zw);
				float2	z;
				float loop_value;
				float loop_count = _LoopCount;
				for (loop_value = 0; loop_value < loop_count; ++loop_value)
				{
					z = float2(z.x * z.x - z.y * z.y, 2 * z.x * z.y) + c;
					if (length(z) > 2) break;
				}
				return loop_value / loop_count;
			}
			ENDCG
		}
	}
}
